function address_auto_complete(){
    $("#citizen_address_attributes_zipcode").on('blur', function(){
        var cep = this.value.replace(/[^0-9]/, "");

        var url = "https://viacep.com.br/ws/"+cep+"/json/";

        $.ajax({
            dataType: "json",
            url: url,
            beforeSend: function(){
                $('.loading').show();
            },
            success: function(data){
                if(data.erro == true){
                    cepError();
                }
                else{
                    $('.loading').delay(500).hide();
                    $("#citizen_address_attributes_number").val('');
                    $("#citizen_address_attributes_public_place").val(data.logradouro);
                    $("#citizen_address_attributes_neighborhood").val(data.bairro);
                    $("#citizen_address_attributes_city").val(data.localidade);
                    $("#citizen_address_attributes_state").val(data.uf);
                    $("#citizen_address_attributes_ibge_code").val(data.ibge);
                    $("#citizen_address_attributes_number").focus();
                }
            },
            error: cepError
        });

        function cepError(){
            $('.loading').delay(500).hide();
            $("#citizen_address_attributes_public_place").focus();
            $("input[id*='citizen_address']").val();
            alert("CEP not found. Fill address manualy");
        }
    });
}

function citizens_mask(){
    $('#citizen_birthdate').mask('00/00/0000', {placeholder: "__/__/____"});
    $('#citizen_cpf').mask('000.000.000-00', {placeholder: "xxx.xxx.xxx-xx"});
    $('#citizen_phone').mask('00 (00) 00000000Z', {
        placeholder: "xx (xx) xxxxxxxx",
        translation: {
            'Z': {
                pattern: /[0-9]/, optional: true
            }
        }
    });

    $('#citizen_address_attributes_zipcode').mask('00000-000', {placeholder: "00000-000"});
}