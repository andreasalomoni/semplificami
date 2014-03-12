jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $("div[rel~=popover], .has-popover").popover()
  $("div[rel~=tooltip], .has-tooltip").tooltip()