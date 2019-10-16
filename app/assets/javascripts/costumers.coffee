$(document).ready ->
  $('.btn_exibir_dados').click ->
    $.ajax '/costumer_informations',
      type: 'GET'
      dataType: 'json'
      data: {
              contract: $("#contract_view").val(),
            }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $(".div_form_costumer").show()
        $('#contract').val(contract)
        $('#name').val(data['informacoes'][0])
        $('#street').val(data['informacoes'][1])
        $('#street_no').val(data['informacoes'][2])
        $('#neighborhood').val(data['informacoes'][3])
    return false;