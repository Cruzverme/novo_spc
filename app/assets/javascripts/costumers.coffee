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
    id = $(this).data('idnew')
    url = "/billings/new?costumer=#{id}"
    window.location.href = url

  $('.btn_show_billing').click ->
    id = $(this).data('idshow')
    url = "/costumers/#{id}"
    console.log(url)
    window.location.href = url


$(document).on 'turbolinks:load', ->
  $('.remove_costumer').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          $(location).attr('href','/costumers');
        error: (jqXHR, textStatus, errorThrown) ->
          M.toast({html:'Problema na remoção da Campanha', classes: 'red', 4000})
    return false