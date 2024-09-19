class ViaCEPModel {
  String? _cep;
  String? _logradouro;
  String? _complemento;
  String? _unidade;
  String? _bairro;
  String? _localidade;
  String? _uf;
  String? _estado;
  String? _regiao;
  String? _ibge;
  String? _gia;
  String? _ddd;
  String? _siafi;

  ViaCEPModel(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? unidade,
      String? bairro,
      String? localidade,
      String? uf,
      String? estado,
      String? regiao,
      String? ibge,
      String? gia,
      String? ddd,
      String? siafi}) {
    if (cep != null) {
      this._cep = cep;
    }
    if (logradouro != null) {
      this._logradouro = logradouro;
    }
    if (complemento != null) {
      this._complemento = complemento;
    }
    if (unidade != null) {
      this._unidade = unidade;
    }
    if (bairro != null) {
      this._bairro = bairro;
    }
    if (localidade != null) {
      this._localidade = localidade;
    }
    if (uf != null) {
      this._uf = uf;
    }
    if (estado != null) {
      this._estado = estado;
    }
    if (regiao != null) {
      this._regiao = regiao;
    }
    if (ibge != null) {
      this._ibge = ibge;
    }
    if (gia != null) {
      this._gia = gia;
    }
    if (ddd != null) {
      this._ddd = ddd;
    }
    if (siafi != null) {
      this._siafi = siafi;
    }
  }

  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get complemento => _complemento;
  set complemento(String? complemento) => _complemento = complemento;
  String? get unidade => _unidade;
  set unidade(String? unidade) => _unidade = unidade;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf;
  String? get estado => _estado;
  set estado(String? estado) => _estado = estado;
  String? get regiao => _regiao;
  set regiao(String? regiao) => _regiao = regiao;
  String? get ibge => _ibge;
  set ibge(String? ibge) => _ibge = ibge;
  String? get gia => _gia;
  set gia(String? gia) => _gia = gia;
  String? get ddd => _ddd;
  set ddd(String? ddd) => _ddd = ddd;
  String? get siafi => _siafi;
  set siafi(String? siafi) => _siafi = siafi;

  ViaCEPModel.fromJson(Map<String, dynamic> json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _unidade = json['unidade'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
    _estado = json['estado'];
    _regiao = json['regiao'];
    _ibge = json['ibge'];
    _gia = json['gia'];
    _ddd = json['ddd'];
    _siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this._cep;
    data['logradouro'] = this._logradouro;
    data['complemento'] = this._complemento;
    data['unidade'] = this._unidade;
    data['bairro'] = this._bairro;
    data['localidade'] = this._localidade;
    data['uf'] = this._uf;
    data['estado'] = this._estado;
    data['regiao'] = this._regiao;
    data['ibge'] = this._ibge;
    data['gia'] = this._gia;
    data['ddd'] = this._ddd;
    data['siafi'] = this._siafi;
    return data;
  }
}
