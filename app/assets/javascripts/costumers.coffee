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
        $('#name').val(data['informacoes'][0])
        $('#street').val(data['informacoes'][1])
        $('#contract').val($("#contract_view").val())
        $('#street_no').val(data['informacoes'][2])
        $('#neighborhood').val(data['informacoes'][3])
    return false;

  # $('.btn_destroy_costumer').click ->
  #   $.ajax '/costumers/' + $("#costumer_id").val(),
  #     type: 'DELETE',
  #     dataType: 'json',
  #     data: {
  #             costumer_id: $("#costumer_id").val(),
  #           }
  #     error: (jqXHR, textStatus, errorThrown) ->
  #       alert textStatus
  #     success: (data, text, jqXHR) ->
  #       alert("APAGADO!")

  #   return false;
