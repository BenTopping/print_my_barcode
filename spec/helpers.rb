# frozen_string_literal: true

module Helpers
  def label_template_params
    ActionController::Parameters.new(
       data:
        { attributes: {
          name: build(:label_template).name,
          label_type_id: create(:label_type).id,
          labels_attributes: labels_attributes
        }}
    )
  end

  def label_template_params_with_invalid_label_type
    ActionController::Parameters.new(
      name: build(:label_template).name,
      labels_attributes: labels_attributes
    )
  end

  def label_template_params_with_invalid_association
    ActionController::Parameters.new(
      name: build(:label_template).name,
      label_type_id: create(:label_type).id,
      labels_attributes: labels_attributes.push(invalid_label_attributes)
    )
  end

  def find_attribute_error_details(json, attribute)
    json['errors']
      .find_all { |e| e['source']['pointer'].include?(attribute) }
      .map { |e| e['detail'] }
  end

  private

  def labels_attributes
    [
      {
        name: build(:label).name,
        barcodes_attributes: [attributes_for(:barcode), attributes_for(:barcode)],
        bitmaps_attributes: [attributes_for(:bitmap), attributes_for(:bitmap)]
      },
      {
        name: build(:label).name,
        barcodes_attributes: [attributes_for(:barcode), attributes_for(:barcode)],
        bitmaps_attributes: [attributes_for(:bitmap), attributes_for(:bitmap)]
      }
    ]
  end

  def invalid_label_attributes
    {
      name: build(:label).name,
      barcodes_attributes: [attributes_for(:barcode), attributes_for(:barcode)],
      bitmaps_attributes: [attributes_for(:bitmap).except(:x_origin), attributes_for(:bitmap)]
    }
  end
end
