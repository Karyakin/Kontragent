using Kontragent.Commands;
using Kontragent.Domain;
using Kontragent.Domain.Models;
using Kontragent.Domain.Repository;
using Kontragent.Domain.RepositoryInterface;
using Kontragent.Mappers;
using Kontragent.Model;
using Kontragent.Model.Update;
using Kontragent.Repository.RepositoryClass;
using Kontragent.Repository.RepositoryInterface;
using Kontragent.Repository.Update;
using Kontragent.ViewModel.Person;
using Kontragent.ViewModel.Risk;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kontragent.ViewModel.Update
{
    public class UpdateViewModel : BaseViewModel
    {
        private RelayCommand _updateOrg;
        private string _UNPOrg;
        private string _shortNameOrg;
        private string _fullNameOrg;

        private string _age;
        private string _descriptionORG;
        private PositiveRiskCheckBoxViewModel _ownershipOrg;
        private NegativeRiskCheckBoxViewModel _taxDebt;
        private NegativeRiskCheckBoxViewModel _debtsEnforcementDocuments;
        private NegativeRiskCheckBoxViewModel _falseBusiness;
        private NegativeRiskCheckBoxViewModel _specialRisc;
        private NegativeRiskCheckBoxViewModel _executeProc;
        private NegativeRiskCheckBoxViewModel _bankruptcyProc;
        private NegativeRiskCheckBoxViewModel _liquidationProc;
        private PositiveRiskCheckBoxViewModel _prevBrokerClient;
        private PositiveRiskCheckBoxViewModel _manufacturer;
        private bool _secondAccred;
        private NegativeRiskCheckBoxViewModel _exchengeTradingDisorders;
        private NegativeRiskCheckBoxViewModel _negativData;
        private PositiveRiskCheckBoxViewModel _reputation;
        private bool _forcedDeposite;
        private string _brokerOpinion;
        private string _auditorOpinion;
        private RiskCreatedDateViewModel _createdateOrg;
        private string _sectionHeadOpinion;
        private bool _resident;
        private ICountryRepository _countryRepository;
        private ISectionRepository _sectionRepository;
        private IRiskListRepository _riskListRepository;

        UpdateOrgModel updateModel;
        UpdateRepository upsateRepo;

        private UpdatePersViewModel _person;
        private UpdateOrgViewModel _organization;

        KontragentModelUpdate kontragentModelUpdate;

        private DateTime _createDataOrg;

        public UpdateViewModel()
        {
            UpdeteOrg = new RelayCommand(SelectForUpdate);
            updateModel = new UpdateOrgModel();
            upsateRepo = new UpdateRepository();

            _createDataOrg = new DateTime();

            _countryRepository = new CountryRepository();  //создаем экземпляр класса CountryRepository, который унаследован от интрефейса ICountryRepository
            List<CountryModel> countries = _countryRepository.GetCountries();// создаем список объектов с типом CountryModel при помощи метода обязательного (Интрерфес) методом GetCountries из репы
            var countryVM = CountryMapper.CountryModelToCountryViewModel(countries);// при помощи статического метода CountryModelToCountryViewModel из класса CountryMapper приводим тип из Модели во Вью модель, чтобы наша вью модель могла работать с данными 

            _sectionRepository = new SectionRepository();
            List<SectionModel> sections = _sectionRepository.GetSections();
            var sectionVM = SectionMappers.SectionModelToSectionViewModel(sections);
            _riskListRepository = new RiskRepository();

            var risks = _riskListRepository.GetRisks();

            Person = new UpdatePersViewModel(countryVM)
            {
                PrevLiquidated = new NegativeRiskCheckBoxViewModel(risks.PrevLiquidated),
                PrevBankruptcy = new NegativeRiskCheckBoxViewModel(risks.PrevBankruptcy),
                PrevExecuteProc = new NegativeRiskCheckBoxViewModel(risks.PrevExecuteProc),
                PrevStateDebt = new NegativeRiskCheckBoxViewModel(risks.PrevStateDebt),
                PrevTaxDebt = new NegativeRiskCheckBoxViewModel(risks.PrevTaxDebt),
                NegativDataPers = new NegativeRiskCheckBoxViewModel(risks.NegativData)
            };

            Organization = new UpdateOrgViewModel(countryVM, sectionVM)
            {
                BrokerClient = new PositiveRiskCheckBoxViewModel(risks.BrokerClient),
                PrevBrokerClient = new PositiveRiskCheckBoxViewModel(risks.PrevBrokerClient),
                Manufacturer = new PositiveRiskCheckBoxViewModel(risks.Manufacturer),
                Reputation = new PositiveRiskCheckBoxViewModel(risks.Reputation),
                OwnershipOrg = new PositiveRiskCheckBoxViewModel(risks.OwnershipOrg),

                TaxDebt = new NegativeRiskCheckBoxViewModel(risks.TaxDebt),
                DebtsEnforcementDocuments = new NegativeRiskCheckBoxViewModel(risks.DebtsEnforcementDocuments),
                FalseBusiness = new NegativeRiskCheckBoxViewModel(risks.FalseBusiness),
                SpecialRisc = new NegativeRiskCheckBoxViewModel(risks.SpecialRisc),
                ExecuteProc = new NegativeRiskCheckBoxViewModel(risks.ExecuteProc),
                BankruptcyProc = new NegativeRiskCheckBoxViewModel(risks.BankruptcyProc),
                LiquidationProc = new NegativeRiskCheckBoxViewModel(risks.LiquidationProc),
                NegativData = new NegativeRiskCheckBoxViewModel(risks.NegativData),
                ExchengeTradingDisorders = new NegativeRiskCheckBoxViewModel(risks.ExchengeTradingDisorders),
                DateEnd = new DateTime()
             
        };
            CreatedateOrg = new RiskCreatedDateViewModel(_riskListRepository.GetAgeOrgRisk());
        }



        private void SelectForUpdate(object obj)
        {
            /*  var organizationModel = SearchMapperOrg.SearchWievModelOrgToOrganizationModel(Kontragent.OrganizationSearc); // из виью модели делаем модель
              var personModel = SearchMapperPers.SearchWievModelPersToPersonModel(Kontragent.PersonSearc); // из виью модели делаем модель
              var kontragentModels = _searchRepository.GeneralSearch(organizationModel, personModel);*/

            updateModel = UpdateMapper.OrganizationViewModelToOrganizationModel(this);
            kontragentModelUpdate = upsateRepo.FindOrgForUpdate(updateModel);

            Organization.UNPOrg = kontragentModelUpdate.OrgForUpdate?.UNPOrg;
            Organization.FullNameOrg = kontragentModelUpdate.OrgForUpdate?.FullNameOrg;
            Organization.ShortNameOrg = kontragentModelUpdate.OrgForUpdate?.ShortNameOrg;
            Organization.BrokerOpinion = kontragentModelUpdate.OrgForUpdate?.BrokerOpinion;
            Organization.AuditorOpinion = kontragentModelUpdate.OrgForUpdate?.AuditorOpinion;
            Organization.SectionHeadOpinion = kontragentModelUpdate.OrgForUpdate?.SectionHeadOpinion;
            Organization.DescriptionOrg = kontragentModelUpdate.OrgForUpdate?.DescriptionOrg;

            Person.DescriptionPers = kontragentModelUpdate.PersForUpdate?.DescriptionPers;
            Person.HeadName = kontragentModelUpdate.PersForUpdate?.HeadName;
            Person.OwnerName = kontragentModelUpdate.PersForUpdate?.OwnerName;
            //Organization.CreatedateOrg.Value = kontragentModelUpdate.OrgForUpdate.CreatedateOrg;
           

        }

        public DateTime CreateDataOrg
        {
            get => _createDataOrg;
            set
            {
                _createDataOrg = value;
                OnPropertyChanged(nameof(CreateDataOrg));
            }
        }


        public UpdatePersViewModel Person
        {
            get => _person;
            set
            {
                _person = value;
                OnPropertyChanged(nameof(Person));
            }
        }

        public UpdateOrgViewModel Organization
        {
            get => _organization;
            set
            {
                _organization = value;
                OnPropertyChanged(nameof(Organization));
            }
        }


        public RelayCommand UpdeteOrg
        {
            get => _updateOrg;
            set
            {
                _updateOrg = value;
                OnPropertyChanged(nameof(UpdeteOrg));
            }
        }

        public List<CountryViewModel> _countries;
        public List<CountryViewModel> Countries
        {
            get => _countries;
            set
            {
                _countries = value;
                OnPropertyChanged(nameof(Countries));
            }
        }

        private CountryViewModel _selectedCountry;
        /// <summary>
        /// Сюда пидет та страна, которая будет выбрана из выпадающего списка
        /// </summary>
        public CountryViewModel SelectedCountry
        {
            get => _selectedCountry;
            set
            {
                _selectedCountry = value;
                OnPropertyChanged(nameof(SelectedCountry));
            }
        }

        public List<SectionViewModel> _section;

        /// <summary>
        /// В этом списке содердится перечень всех секций полученных из базы
        /// </summary>
        public List<SectionViewModel> Section
        {
            get => _section;
            set
            {
                _section = value;
                OnPropertyChanged(nameof(Section));
            }
        }

        private SectionViewModel _selectedSection;
        private PositiveRiskCheckBoxViewModel _brokerClient;
        private PositiveRiskCheckBoxViewModel _tradingexperience;
        private bool _trader;
        private string _sharedVariable;

        /// <summary>
        /// Сюда пидет та секция, которая будет выбрана из выпадающего списка
        /// </summary>
        public SectionViewModel SelectedSection
        {
            get => _selectedSection;
            set
            {
                var removingSection = _selectedSection;
                _selectedSection = value;
                OnPropertyChanged(nameof(SelectedSection));
            }
        }


        #region Cвойства организации

        public string SharedVariable
        {
            get => _sharedVariable;
            set
            {
                _sharedVariable = value;
                OnPropertyChanged(nameof(SharedVariable));
            }
        }

        public string UNPOrg
        {
            get => _UNPOrg;
            set
            {
                _UNPOrg = value;
                OnPropertyChanged(nameof(UNPOrg));
            }
        }

        public string ShortNameOrg
        {
            get => _shortNameOrg;
            set
            {
                _shortNameOrg = value;
                OnPropertyChanged(nameof(ShortNameOrg));
            }
        }

        public string FullNameOrg
        {
            get => _fullNameOrg;
            set
            {
                _fullNameOrg = value;
                OnPropertyChanged(nameof(FullNameOrg));
            }
        }

        public string DescriptionORG
        {
            get => _descriptionORG;// return _descriptionORG
            set
            {
                _descriptionORG = value;
                OnPropertyChanged(nameof(DescriptionORG));
            }
        }

        public PositiveRiskCheckBoxViewModel OwnershipOrg
        {
            get => _ownershipOrg;
            set
            {
                _ownershipOrg = value;
                OnPropertyChanged(nameof(OwnershipOrg));
            }
        }

        public NegativeRiskCheckBoxViewModel TaxDebt
        {
            get => _taxDebt;
            set
            {
                _taxDebt = value;
                OnPropertyChanged(nameof(TaxDebt));
            }
        }

        public NegativeRiskCheckBoxViewModel DebtsEnforcementDocuments
        {
            get => _debtsEnforcementDocuments;
            set
            {
                _debtsEnforcementDocuments = value;
                OnPropertyChanged(nameof(DebtsEnforcementDocuments));
            }
        }

        public NegativeRiskCheckBoxViewModel FalseBusiness
        {
            get => _falseBusiness;
            set
            {
                _falseBusiness = value;
                OnPropertyChanged(nameof(FalseBusiness));
            }
        }

        public NegativeRiskCheckBoxViewModel SpecialRisc
        {
            get => _specialRisc;
            set
            {
                _specialRisc = value;
                OnPropertyChanged(nameof(SpecialRisc));
            }
        }

        public NegativeRiskCheckBoxViewModel ExecuteProc
        {
            get => _executeProc;
            set
            {
                _executeProc = value;
                OnPropertyChanged(nameof(ExecuteProc));
            }
        }

        public NegativeRiskCheckBoxViewModel BankruptcyProc
        {
            get => _bankruptcyProc;
            set
            {
                _bankruptcyProc = value;
                OnPropertyChanged(nameof(BankruptcyProc));
            }
        }

        public NegativeRiskCheckBoxViewModel LiquidationProc
        {
            get => _liquidationProc;
            set
            {
                _liquidationProc = value;
                OnPropertyChanged(nameof(LiquidationProc));
            }
        }

        public PositiveRiskCheckBoxViewModel BrokerClient
        {
            get => _brokerClient;
            set
            {
                _brokerClient = value;
                OnPropertyChanged(nameof(BrokerClient));
            }
        }

        public PositiveRiskCheckBoxViewModel PrevBrokerClient
        {
            get => _prevBrokerClient;
            set
            {
                _prevBrokerClient = value;
                OnPropertyChanged(nameof(PrevBrokerClient));
            }
        }


        public PositiveRiskCheckBoxViewModel Tradingexperience
        {
            get => _tradingexperience;
            set
            {
                _tradingexperience = value;
                OnPropertyChanged(nameof(Tradingexperience));
            }
        }



        public PositiveRiskCheckBoxViewModel Manufacturer
        {
            get => _manufacturer;
            set
            {
                _manufacturer = value;
                OnPropertyChanged(nameof(Manufacturer));
            }
        }

        public bool SecondAccred
        {
            get => _secondAccred;
            set
            {
                _secondAccred = value;
                OnPropertyChanged(nameof(SecondAccred));

            }
        }
        /// <summary>
        /// => - return. FirstAccred становится противоположностью SecondAccred
        /// </summary>
        public bool FirstAccred => !SecondAccred;

        public NegativeRiskCheckBoxViewModel ExchengeTradingDisorders
        {
            get => _exchengeTradingDisorders;
            set
            {
                _exchengeTradingDisorders = value;
                OnPropertyChanged(nameof(ExchengeTradingDisorders));
            }
        }

        public NegativeRiskCheckBoxViewModel NegativData
        {
            get => _negativData;
            set
            {
                _negativData = value;
                OnPropertyChanged(nameof(NegativData));
            }
        }

        public PositiveRiskCheckBoxViewModel Reputation
        {
            get => _reputation;
            set
            {
                _reputation = value;
                OnPropertyChanged(nameof(Reputation));
            }
        }

        public bool ForcedDeposite
        {
            get => _forcedDeposite;
            set
            {
                _forcedDeposite = value;
                OnPropertyChanged(nameof(ForcedDeposite));
            }
        }

        // public bool Trader => !BrokerClient.Value;

        public bool Trader
        {
            get => _trader;
            set
            {
                _trader = value;
                OnPropertyChanged(nameof(Trader));
            }
        }

        /* public bool BrokerClient
         {
             get => _brokerClient;
             set
             {
                 _brokerClient = value;
                 OnPropertyChanged(nameof(BrokerClient));
             }
         }*/





        public string BrokerOpinion
        {
            get => _brokerOpinion;
            set
            {
                _brokerOpinion = value;
                OnPropertyChanged(nameof(BrokerOpinion));
            }
        }
        public bool Resident => SelectedCountry?.NameCountry == "Беларусь" ? _resident = true : _resident = false; //System.NullReferenceException: "Ссылка на объект не указывает на экземпляр объекта."


        public string AuditorOpinion
        {
            get => _auditorOpinion;
            set
            {
                _auditorOpinion = value;
                OnPropertyChanged(nameof(AuditorOpinion));
            }
        }



        /// <summary>
        /// Строка для отображения количества лет, месяцев и дней
        /// </summary>
        public string Age
        {
            get => _age;
            set
            {
                _age = value;
                OnPropertyChanged(nameof(Age));
            }
        }

        public RiskCreatedDateViewModel CreatedateOrg
        {
            get => _createdateOrg;
            set
            {
                _createdateOrg = value;
                OnPropertyChanged(nameof(CreatedateOrg));
            }
        }
        public string SectionHeadOpinion
        {
            //условие ? истина : лдожь
            get => _sectionHeadOpinion;
            set
            {
                _sectionHeadOpinion = value;
                OnPropertyChanged(nameof(SectionHeadOpinion));
            }
        }

        #endregion



    }
}
