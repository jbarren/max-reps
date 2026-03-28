require "rails_helper"

RSpec.describe "Series", type: :request do
  describe "GET /series" do
    it "returns 200" do
      get series_path
      expect(response).to have_http_status(:ok)
    end

    it "lists existing series" do
      create(:serie, reps: 12)
      create(:serie, :fallo, reps: 8)

      get series_path

      expect(response.body).to include("12")
      expect(response.body).to include("FALLO")
    end

    it "shows total reps" do
      create(:serie, reps: 10)
      create(:serie, reps: 5)

      get series_path

      expect(response.body).to include("15")
    end

    it "renders the form when there are no series" do
      get series_path
      expect(response.body).to include("Nueva serie")
    end
  end

  describe "POST /series" do
    context "with valid params" do
      it "creates a serie and redirects" do
        expect {
          post series_path, params: { serie: { reps: 10, mark: "" } }
        }.to change(Serie, :count).by(1)

        expect(response).to redirect_to(series_path)
      end

      it "saves reps correctly" do
        post series_path, params: { serie: { reps: 15, mark: "" } }
        expect(Serie.last.reps).to eq(15)
      end

      it "saves mark FALLO" do
        post series_path, params: { serie: { reps: 8, mark: "FALLO" } }
        expect(Serie.last.mark).to eq("FALLO")
      end

      it "saves mark GOMA" do
        post series_path, params: { serie: { reps: 8, mark: "GOMA" } }
        expect(Serie.last.mark).to eq("GOMA")
      end

      it "stores nil when mark is blank" do
        post series_path, params: { serie: { reps: 10, mark: "" } }
        expect(Serie.last.mark).to be_nil
      end
    end

    context "with invalid params" do
      it "does not create a serie" do
        expect {
          post series_path, params: { serie: { reps: nil, mark: "" } }
        }.not_to change(Serie, :count)
      end

      it "returns unprocessable_entity" do
        post series_path, params: { serie: { reps: nil, mark: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /series/:id" do
    it "destroys the serie and redirects" do
      serie = create(:serie)

      expect {
        delete serie_path(serie)
      }.to change(Serie, :count).by(-1)

      expect(response).to redirect_to(series_path)
    end
  end
end
