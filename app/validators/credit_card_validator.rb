class CreditCardValidator < ActiveModel::Validator

  def is_number?(obj)
        obj.to_s.match(/\A[+-]?\d+?\Z/) == nil ? false : true
    end

  def validate(record)
    # record es la instancia del objeto actual a validar
    # options[:fields] contiene sólo los hashes pasados en la opción :fields, no contiene los valores de la instancia
    opts_card = {count: 4}
    opts_sec_code = {count: 3}

    special = [:expires_on]
    special_fields = options[:fields] & special # Campos especiales, por ejemplo una fecha, que no aparecerá en blanco si no se completa
    normal_fields = options[:fields] - special_fields # Todos los demás campos, de acá se buscan los campos en blanco

    blank_fields = normal_fields.select {|field| record.send(field).blank?} # Campos en blanco...
    
    if blank_fields.length() != normal_fields.length()
	    # No todos los campos están en blanco, entonces hay que validar...
	  
      # Los campos card_1 a card_4 deben tener 4 caracteres numéricos
      card_n = normal_fields & [:card_1, :card_2, :card_3, :card_4]
      wrong_length_fields = card_n.select {|field| record.send(field).to_s.length != 4} - blank_fields # Si el campo ya está en blanco no se incluye en la lista de errores
      not_a_number_fields = card_n.select {|field| not is_number? record.send(field)} - blank_fields

      # Código de seguridad debe ser 3 caracteres numéricos
      if (options[:fields].include? :security_code)
        sec_code = record.send(:security_code)
        if sec_code.present?
          if sec_code.to_s.length != 3
            record.errors.add(:security_code, :wrong_length, opts_sec_code)
          end
          if not is_number? sec_code
            not_a_number_fields << :security_code
          end
        end
      end

      # :expires_on debe ser un date posterior al actual
      if (special_fields.include? :expires_on)
        exp_on = record.send(:expires_on)
        if exp_on.blank?
          blank_fields << :expires_on
        elsif ((exp_on.year < Date.today.year) or (exp_on.year == Date.today.year and exp_on.month < Date.today.month))
          record.errors.add(:expires_on, :too_old)
        end
      end

      # Un error por cada campo que está en blanco
      # Los campos :card_owner_last_name y :card_owner_first_name deben ser validados
      # para que no estén vacíos, lo cual se hizo ya al buscar los campos en blanco.
      blank_fields.each do |f|
        record.errors.add(f, :blank)
      end

      wrong_length_fields.each do |f|
        record.errors.add(f, :wrong_length, opts_card)
      end

      not_a_number_fields.each do |f|
        record.errors.add(f, :not_a_number)
      end
    end
  end
end
