+++
widget = "blank"
headless = true  # This file represents a page section.

# ... Put Your Section Options Here (title etc.) ...

active = false  # Activate this widget? true/false
weight = 2  # Order that this section will appear.
title = "My interests"
subtitle = "This is a tag_cloud widget. <br/> It is using 'tags' as taxonomy and a background color."
[content]
  # Choose the taxonomy from `config.toml` to display (e.g. tags, categories)
  taxonomy = "tags"
  # Choose how many tags you would like to display (0 = all tags)
  count = 20
[design]
  # Minimum and maximum font sizes (1.0 = 100%).
  font_size_min = 0.7
  font_size_max = 1.5
  # Choose how many columns the section has. Valid values: 1 or 2.
  columns = "1"

[design.background]
  # Apply a background color, gradient, or image.
  #   Uncomment (by removing `#`) an option to apply it.
  #   Choose a light or dark text color by setting `text_color_light`.
  #   Any HTML color name or Hex value is valid.
  # Background color.
  color = "blue"
  text_color_light = false
+++
