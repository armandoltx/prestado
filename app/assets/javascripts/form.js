$(document).ready(function(){
  console.log('testing my js');

  $('input').focus(function(t){
    // var $this = $(this);
    // var $parent = $this.closest('.input-group');
    // var $label = $parent.find('label');
    // // OR: $label = $(this).next();
    // OR:
    $(this).siblings('label').addClass('active');
  });

  $('input').blur(function(){
    //  var $this = $(this);
    //  var $parent = $this.closest('.input-group');
    //  var $label = $parent.find('label');
    //  if ($this.val()){
    //   $label.removeClass('active');
    // }
    if($(this).val() == ''){
      $(this).siblings().filter('label').removeClass('active');
    }
    // else {
    //   $label.addClass('active');
    // }
  });
});
