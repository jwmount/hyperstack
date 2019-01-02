class HelloWorld < HyperComponent
  render(DIV) do
    # try changing 'world' to your own name
    H1 { 'Hello mysterious world' }
    P(class: 'blue-text') { "Let's get started!" }
    P(class: 'background_color') { "Let's get started in color!" }
  end
end
