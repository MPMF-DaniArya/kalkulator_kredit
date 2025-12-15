class TScore {
  // usia
  static const usia = [19, 25, 34, 54];

  // maritial status
  static const menikah = 'Menikah';
  static const single = 'Single';
  static const dudaOrJanda = 'Duda/Janda';

  static const scoreMaritialStatus = {menikah: 6, single: 0, dudaOrJanda: -14};

  // home status
  static const sendiri = 'Sendiri';
  static const orangTua = 'Orang Tua';
  static const keluarga = 'Keluarga';
  static const kontrakOrKost = 'Kontrak / Kost';
  static const perusahaan = 'Perusahaan';

  static const homeStatus = {
    sendiri: 5,
    orangTua: -2,
    keluarga: 4,
    kontrakOrKost: -4,
    perusahaan: 2
  };

  // pekerjaan
  static const employee = 'Employee';
  static const entrepreneur = 'Entrepreneur';
  static const professional = 'Professional';

  static const pekerjaan = {employee: 10, entrepreneur: 0, professional: -4};

  // asset
  static const beat = 'BEAT';
  static const vario = 'VARIO';
  static const scoopy = 'SCOOPY';

  static const otr = {
    beat: 22000000,
    vario: 26000000,
    scoopy: 25000000,
  };

  // tenor
  static const tenor = {12: 32, 24: -1, 36: -9, 48: -26};

  // kredit aktif
  static const ya = 'Ya';
  static const tidak = 'Tidak';

  static const kreditAktif = {ya: -2, tidak: 46};

  // penyedia fasilitas kredit
  static const bank = 'Bank';
  static const multifinance = 'Multifinance';
  static const fintech = 'Fintech';
  static const lainnya = 'Lainnya';

  static const penyediaFasilitasKredit = {
    bank: {ya: -7, tidak: 0},
    multifinance: {ya: -7, tidak: 0},
    fintech: {ya: -7, tidak: 0},
    lainnya: {ya: -7, tidak: 0},
  };

  // keterlambatan bayar 12 bulan
  static const lamaKeterlambatan = {
    ya: -41,
    tidak: 60
  };

  //  kategori risk & action
  static const e3 = 'E3';
  static const e2 = 'E2';
  static const e1 = 'E1';
  static const d3 = 'D3';
  static const d2 = 'D2';
  static const d1 = 'D1';
  static const c3 = 'C3';
  static const c2 = 'C2';
  static const c1 = 'C1';
  static const b3 = 'B3';
  static const b2 = 'B2';
  static const b1 = 'B1';
  static const a3 = 'A3';
  static const a2 = 'A2';
  static const a1 = 'A1';

  static const veryHighRisk = 'Very High Risk';
  static const highRisk = 'High Risk';
  static const averageRisk = 'Average Risk';
  static const lowRisk = 'Low Risk';
  static const veryLowRisk = 'Very Low Risk';

  static const kategoriRisk = {
    e3: veryHighRisk,
    e2: veryHighRisk,
    e1: veryHighRisk,
    d3: highRisk,
    d2: highRisk,
    d1: highRisk,
    c3: averageRisk,
    c2: averageRisk,
    c1: averageRisk,
    b3: lowRisk,
    b2: lowRisk,
    b1: lowRisk,
    a3: veryLowRisk,
    a2: veryLowRisk,
    a1: veryLowRisk,
  };

  static const reject = 'Reject';
  static const needSurveyAndCreditCommitteeReview = 'Need Survey & Credit Committee Review';
  static const needSurvey = 'Need Survey';
  static const instantApproval = 'Instant Approval';
}
