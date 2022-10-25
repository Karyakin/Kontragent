﻿using Kontragent.Helper;
using Kontragent.ViewModel.Risk;
using ReactiveValidation;
using ReactiveValidation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kontragent.ViewModel.Update
{
   public class UpdatePersViewModel : BaseViewModel
    {
        private string _ownerName;
        private string _headName;
        public NegativeRiskCheckBoxViewModel _prevLiquidated;
        public NegativeRiskCheckBoxViewModel _prevBankruptcy;
        public NegativeRiskCheckBoxViewModel _prevStateDebt;
        public NegativeRiskCheckBoxViewModel _prevTaxDebt;
        public NegativeRiskCheckBoxViewModel _prevExecuteProc;
        public NegativeRiskCheckBoxViewModel _negativDataPers;
        public string _descriptionPers;


        public UpdatePersViewModel()
        {
            Validator = GetValidator();
        }

        private IObjectValidator GetValidator()
        {
            var personBuilder = new ValidationBuilder<UpdatePersViewModel>();
            personBuilder.RuleFor(x => x.OwnerName).NotEmpty().WithMessage("Поле не может быть пустым");
            personBuilder.RuleFor(x => x.OwnerName).MinLength(2).WithMessage("Поле должно содержать минимум два символа");
            personBuilder.RuleFor(x => x.OwnerName).Matches(@"[A-Za-zА-Яа-яЁё].").WithMessage("Поле должно минимум две буквы");

            personBuilder.RuleFor(x => x.HeadName).NotEmpty().WithMessage("Поле не может быть пустым");
            personBuilder.RuleFor(x => x.HeadName).MinLength(2).WithMessage("Поле должно содержать минимум два символа");
            personBuilder.RuleFor(x => x.HeadName).Matches(@"[A-Za-zА-Яа-яЁё].").WithMessage("Поле должно минимум две буквы");



            personBuilder.RuleFor(x => x.SelectedCountry).Must(BeAValidCountry).WithMessage("Укажите страну");
            return personBuilder.Build(this);
        }
        private bool BeAValidCountry(CountryViewModel country)
        {
            return country != null && country.NameCountry != "(не выбрано)";
        }

        /// <summary>
        /// Этот конструктор для приема списка стран и последующей передачи его NewOrganizationViewModel
        /// При загруске еонструктора в него будем передавать объект класса Country
        /// </summary>
        /// <param name="countries"></param>
        public UpdatePersViewModel(List<CountryViewModel> countries) : this()
        {
            Validator = GetValidator();
            Countries = countries;
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
        /// В это свойство попадает та страна, которая выпадет из выпадающего списка.
        /// </summary>
        public CountryViewModel SelectedCountry
        {
            get => _selectedCountry;
            set
            {
                var removingCountry = _selectedCountry;
                _selectedCountry = value;
                RiskCalculator.Note(SelectedCountry, removingCountry);
                if (value != null)
                {
                    OnPropertyChanged(nameof(SelectedCountry));
                }
            }
        }

        public string OwnerName
        {
            get => _ownerName;
            set
            {
                _ownerName = value;
                OnPropertyChanged(nameof(OwnerName));
            }
        }
        public string HeadName
        {
            get => _headName;
            set
            {
                _headName = value;
                OnPropertyChanged(nameof(HeadName));
            }
        }

        public string DescriptionPers
        {
            //условие ? истина : лдожь
            get => _descriptionPers;
            set
            {
                _descriptionPers = value;
                OnPropertyChanged(nameof(DescriptionPers));
            }
        }

        public NegativeRiskCheckBoxViewModel PrevLiquidated
        {
            get => _prevLiquidated;
            set
            {
                _prevLiquidated = value;
                OnPropertyChanged(nameof(PrevLiquidated));
            }
        }
        public NegativeRiskCheckBoxViewModel PrevBankruptcy
        {
            get => _prevBankruptcy;
            set
            {
                _prevBankruptcy = value;
                OnPropertyChanged(nameof(PrevBankruptcy));
            }
        }
        public NegativeRiskCheckBoxViewModel PrevStateDebt
        {
            get => _prevStateDebt;
            set
            {
                _prevStateDebt = value;
                OnPropertyChanged(nameof(PrevStateDebt));
            }
        }
        public NegativeRiskCheckBoxViewModel PrevTaxDebt
        {
            get => _prevTaxDebt;
            set
            {
                _prevTaxDebt = value;
                OnPropertyChanged(nameof(PrevTaxDebt));
            }
        }
        public NegativeRiskCheckBoxViewModel PrevExecuteProc
        {
            get => _prevExecuteProc;
            set
            {
                _prevExecuteProc = value;
                OnPropertyChanged(nameof(PrevExecuteProc));
            }
        }
        public NegativeRiskCheckBoxViewModel NegativDataPers
        {
            get => _negativDataPers;
            set
            {
                _negativDataPers = value;
                OnPropertyChanged(nameof(NegativDataPers));
            }
        }
    }
}
