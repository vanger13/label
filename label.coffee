appendLabel = (text, link, options)->
  if text and link
    html = '<div class="labelBlock">
              <a href="@labelHref" target="_blank">
                <div id="@labelId">
                  <span>@labelText</span>
                </div>
              </a>
            </div>'
    if !options
      options = {}

    if options and options.id
      id = options.id
    else
      id = "label" + Date.now()
    css = '
            #@labelId {
                position: fixed !important;
                background-color: @labelBackground;
                top: @labelTop;
                @labelSide: 0px;
                padding: 10px;
                max-height: 40px;
                color: @labelText !important;
                text-align: center !important;
                -webkit-transition-duration: 0.3s;
                -moz-transition-duration: 0.3s;
                -o-transition-duration: 0.3s;
                transition-duration: 0.3s !important;
                -webkit-border-radius: 2px 0 0 2px;
                -moz-border-radius: 2px 0 0 2px;
                border-radius: 2px 0 0 2px !important;
                line-height: 20px !important;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5) !important;
                white-space: nowrap !important;
                z-index: 10000 !important;
            }'

    css = css
    .replace '@labelId', id
    .replace '@labelBackground', options.backgroundColor || 'red'
    .replace '@labelTop', options.top || '300px'
    .replace '@labelText', options.textColor || 'white'
    .replace '@labelSide', options.side || 'right'
    style = document.createElement "style"
    style.setAttribute 'type', 'text/css'

    style.appendChild document.createTextNode css
    document.body.appendChild style

    component = document.createElement "div"
    html = html
    .replace '@labelText', text
    .replace '@labelHref', link
    .replace '@labelId', id

    component.innerHTML = html
    document.body.appendChild component