# frozen_string_literal: true

module LabelPrinter
  module Commands
    # Bit map font data command (RC)
    class BitmapDraw < Commands::Base
      # Description: Draws bit map font data
      # Format: [ESC] RCaaa; bbb ------ bbb [LF] [NUL]
      # Description: RC001;{{location}}
      # aaa: Character string number
      # bbb ------ bbb: Data string to be printed

      prefix_accessor 'RC'

      include Commands::Drawing
    end
  end
end
