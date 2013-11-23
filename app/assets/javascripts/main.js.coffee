# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $('#search_section_id').on('change',
    ->
      $('#search_form').attr('action', '/sections/'+ $(this).val())
  )

$ ->
  $('#advert_dob').datepicker({
    dateFormat: "yy-mm-dd",
    showOn: "both",
    buttonImage: "/assets/calendar.gif",
    buttonImageOnly: true
  })

$ ->
  $('#locations').on('change',
    ->
      window.location.href = '/locations/'+ $(this).val()
  )

$ ->
  $('#help').accordion({
     heightStyle: "content" });

$ ->
  $("#tabs").tabs();

$ ->
  $(".side-menu").click ->
    text = $(this).text()
    $(this).next().toggle('blind', 400)
    if $(this).children("img").attr('src') == '/assets/arrow-down.jpg'
       $(this).children("img").attr('src', '/assets/arrow-right.png').height(12).width(7)
    else
      $(this).children("img").attr('src', '/assets/arrow-down.jpg').height(6).width(12)



index = 0

image_gallery = (i) ->
    image = $('.image').eq(i).attr('rel')
    $(".large-car").hide()
    $(".large-car").show()
    $(".large-car").html("<img src='#{image}' />")
    $("#image-index").text("#{i + 1} / #{$('.image').length}")
    return false

$ ->
  $(".image").click ->
    index = $('.image').index(this)
    image_gallery(index)

$ ->
  $(".prev").click ->
    if index == 0
      image_gallery(index = $('.image').length - 1)
    else
      image_gallery(--index)

$ ->
  $(".next").click ->
    if index == $('.image').length - 1
      image_gallery(index = 0)
    else
      image_gallery(++index)




readImage = (input) ->
  if(input[0].files)
    reader = new FileReader()
    reader.onload = (e) ->
      div = $('<div>').addClass('preview')
      image = $('<img>').attr("src", e.target.result).width(80).height(45)
      span = $('<span>').text("Remove").addClass(input.attr('id'))
      $(div).append(image)
      $(div).append(span)
      $(div).appendTo('#image-viewer')
    reader.readAsDataURL(input[0].files[0])


$ ->
  $('#image-viewer').on('click', 'span',
    ->
      $("##{$(this).attr('class')}").remove()
      $(this).parent('div').remove()
  )


$ ->
  $("input[type=file]").change ->
      clone = $(this).clone(true)
      clone.val(null)
      clone.attr('name', "advert[photos_attributes][#{$(".image_file").length}][image]")
      clone.attr('id', "advert_photos_attributes_#{$(".image_file").length}_image")
      if $("input[type=file]").length < 10
        clone.appendTo("#image-file")
      else
        $("#image-file").hide()
      $(this).hide()
      readImage($(this))
      return false






set_pricing_strategy = ->
  $ ->
    (
     if $('#advert_pricing_strategy_price').is(':checked')
       $('#advert_price').attr('disabled', false)
     else
       $('#advert_price').value = 0
       $('#advert_price').attr('disabled', true)
    )

$(set_pricing_strategy())

$ ->
  ($(".radio_buttons").click(
    ->
      set_pricing_strategy()
  ))


$ ->
  ($("#advert_promote_attributes_top_ad_days").on("change",
  ->
    if $("#advert_promote_attributes_top_ad_days").val() == '3'
      $("#topadamount").hide()
    else
      $("#topadamount").show()
  ))


validate_check_box = ->
  $ ->
    (
      if $('.radio_class').is(':checked')
        $('#repost_button').attr('disabled', false)
        $('#delete').attr('disabled', false)
      else
        $('#repost_button').attr("disabled", true)
        $('#delete').attr('disabled', true)
    )

$(validate_check_box())

$ ->
  ($("#all").on("change",
  ->
    if $("#all").is(':checked')
       $(".radio_class").prop("checked", true)
       validate_check_box()
    else
      $(".radio_class").prop("checked", false)
      validate_check_box()

  ))

$ ->
  ($(".radio_class").on("change",
  ->
    validate_check_box()
  ))

$ ->
  ($("#delete").click(
    ->
      $('#my-form').attr('action', '/delete_adverts')
      $('#my-form').attr('method', 'delete')
  ))

$ ->
  ($("#repost_button").click(
    ->
      $('#my-form').attr('action', '/repost')
      $('#my-form').attr('method', 'put')
  ))

$ ->
  ($(".radio_buttons").click(
    ->
      if $("#advert_sale_by_dealer").is(":checked")
        $("#stock").show()
      else
        $("#advert_stock").val('')
        $("#stock").hide()
  ))

$ ->
  ($("input[name='carproof']").click(
    ->
      if $("#purchase_carproof").is(":checked")
        $('#advert_report_url').val(''); $("#url").hide()
        $("#vin").show(500)
      else if $("#already_carproof").is(":checked")
        $('#advert_vin').val(''); $("#vin").hide()
        $("#url").show(500)
      else
        $('#advert_vin').val(''); $("#vin").hide()
        $('#advert_report_url').val(''); $("#url").hide()
  ))


$ ->
  ($('#price').click(
    ->
      url = window.location.href
      param = ''
      if (isNaN($('#field1').val()) || $('#field1').val() =='' || isNaN($('#field2').val()) || $('#field2').val() =='')
        alert('Invalid value.')
        $('#field1').val('').focus()  if (isNaN($('#field1').val()) || $('#field1').val() =='')
        $('#field2').val('').focus()  if (isNaN($('#field2').val()) || $('#field2').val() =='')
      else
        if url.indexOf('?') != -1
          param = '&field1='+ $('#field1').val() + '&field2='+ $('#field2').val()
        else
          param = '?field1='+ $('#field1').val() + '&field2='+ $('#field2').val()
        url = url+param
        window.location.href = url
  ))

$ ->
  ($('#kilometer').click(
    ->
      param = ''
      if (isNaN($('#field3').val()) || $('#field3').val() =='' || isNaN($('#field4').val()) || $('#field4').val() =='')
        alert('Invalid value.')
        $('#field3').val('').focus()  if (isNaN($('#field3').val()) || $('#field3').val() =='')
        $('#field4').val('').focus()  if (isNaN($('#field4').val()) || $('#field4').val() =='')
      else
        if window.location.href.indexOf('?') != -1
          param = '&field3='+ $('#field3').val() + '&field4='+ $('#field4').val()
        else
          param = '?field3='+ $('#field3').val() + '&field4='+ $('#field4').val()
        window.location.href = window.location.href + param
  ))

$ ->
  ($('#year').click(
    ->
      param = ''
      if (isNaN($('#field5').val()) || $('#field5').val() =='' || isNaN($('#field6').val()) || $('#field6').val() =='')
        alert('Invalid value.')
        $('#field5').val('').focus()  if (isNaN($('#field5').val()) || $('#field5').val() =='')
        $('#field6').val('').focus()  if (isNaN($('#field6').val()) || $('#field6').val() =='')
      else
        if window.location.href.indexOf('?') != -1
          param = '&field5='+ $('#field5').val() + '&field6='+ $('#field6').val()
        else
          param = '?field5='+ $('#field5').val() + '&field6='+ $('#field6').val()
        window.location.href = window.location.href + param
  ))


$ ->
  $("#advert_make").on("change",
    ->
      if $("#advert_make option:selected").val() == ''
        $("#advert_model").attr("disabled", true)
      else
        $("#advert_model").attr('disabled', false)
        $.ajax({
             type: 'GET',
             url: '/categories/cars-trucks/adverts/new.js?make=' + $("#advert_make option:selected").val()
            })
  )

$ ->
  $("#advert_promotes_attributes_0_top_ad_days").on("change",
    ->
      $.ajax({
          type: 'GET',
          url: '/categories/cars-trucks/adverts/new.js?value='+ $(this).val()
      })
  )

