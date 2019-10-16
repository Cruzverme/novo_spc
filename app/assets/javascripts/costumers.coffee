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

  $('.btn_new_billing').click ->
    id = $("#costumer_id").val()
    url = "/billings/new?costumer=#{id}"
    window.location.href = url

