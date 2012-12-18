$(function(){

for (var x = 0; x < $('.status').length; x++)
  {
    if ($('.status')[x].textContent.trim() == "DELAYS")
    {
      add_delay(x);
    }
    if ($('.status')[x].textContent.trim() == "GOOD SERVICE")
    {
      add_good(x);
    }
    if ($('.status')[x].textContent.trim() == "SERVICE CHANGE")
    {
      add_change(x);
    }
  }

});

function add_delay(x)
{
  $($('.status')[x]).addClass('delay');
}

function add_good(x)
{
  $($('.status')[x]).addClass('good');
}

function add_change(x)
{
  $($('.status')[x]).addClass('change');
}