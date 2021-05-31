module CompaniesHelper
    class CompaniesControllerHandler
        include PitchDeckSplitter

        EMPTY_STRING = ''

        def initialize(params)
            @company_params = params
        end

        def handle_create
            return false unless valid_params
            company_data = @company_params
            file_path = @company_params[:attachment].tempfile.path
            company_data[:attachment] = @company_params[:attachment].original_filename
            company = Company.create!(company_data)
            split_company_file(company, file_path)
        end

        private

        def valid_params
            return false unless valid_string(@company_params[:name])
            return false unless valid_string(@company_params[:description])
            return false unless valid_attachment(@company_params[:attachment])
            true
        end

        def valid_string(value)
            value.present? && value != EMPTY_STRING
        end

        def valid_attachment(value)
            value.present?
        end
    end 
end
