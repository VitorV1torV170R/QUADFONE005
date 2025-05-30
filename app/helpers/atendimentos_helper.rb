module AtendimentosHelper

    <% if @atendimento.image.attached? %>
        <%= image_tag url_for(@product.image) %>
    <% end %>

end
