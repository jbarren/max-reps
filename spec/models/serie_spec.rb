require "rails_helper"

RSpec.describe Serie, type: :model do
  describe "validations" do
    it "is valid with reps and no mark" do
      expect(build(:serie)).to be_valid
    end

    it "is valid with mark FALLO" do
      expect(build(:serie, :fallo)).to be_valid
    end

    it "is valid with mark GOMA" do
      expect(build(:serie, :goma)).to be_valid
    end

    it "is invalid without reps" do
      expect(build(:serie, reps: nil)).not_to be_valid
    end

    it "is invalid with negative reps" do
      expect(build(:serie, reps: -1)).not_to be_valid
    end

    it "is valid with zero reps" do
      expect(build(:serie, reps: 0)).to be_valid
    end

    it "is invalid with an unrecognized mark" do
      expect(build(:serie, mark: "UNKNOWN")).not_to be_valid
    end
  end

  describe "constants" do
    it "exposes allowed marks" do
      expect(Serie::MARKS).to contain_exactly("FALLO", "GOMA")
    end
  end
end
