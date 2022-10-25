using Kontragent.Domain.Models.Organization;
using Kontragent.Domain.Models.Person;
using Kontragent.Model;
using Kontragent.Model.Update;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Kontragent.Repository.Update
{
    public class UpdateRepository
    {
        private static string connectionStringSQL = ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString;
        public KontragentModelUpdate FindOrgForUpdate(UpdateOrgModel orgModelForUpdate)
        {

            UpdateOrgModel searchOrg = new UpdateOrgModel();
            UpdatePersModel searchPer = new UpdatePersModel();
            KontragentModelUpdate kontragent = new KontragentModelUpdate();


            using (SqlConnection sqlConnection = new SqlConnection(connectionStringSQL))
            {
                sqlConnection.Open();
                SqlCommand SelectForUpdatecomm = new SqlCommand("Select_For_Apdate", sqlConnection);
                SelectForUpdatecomm.CommandType = CommandType.StoredProcedure;

                SelectForUpdatecomm.Parameters.AddWithValue("UNP_Org", orgModelForUpdate.SharedVariable);
                SelectForUpdatecomm.Parameters.AddWithValue("Short_Name_Org", orgModelForUpdate.ShortNameOrg);
                SelectForUpdatecomm.Parameters.AddWithValue("Full_Name_Org", orgModelForUpdate.FullNameOrg);

                SqlDataReader sqlDataReader = SelectForUpdatecomm.ExecuteReader();
                if (sqlDataReader.HasRows != true)
                {
                    SelectForUpdatecomm.Cancel();
                    sqlDataReader.Close();
                    SelectForUpdatecomm = new SqlCommand("Select_For_Apdate", sqlConnection);
                    SelectForUpdatecomm.CommandType = CommandType.StoredProcedure;

                    SelectForUpdatecomm.Parameters.AddWithValue("UNP_Org", orgModelForUpdate.UNPOrg);
                    SelectForUpdatecomm.Parameters.AddWithValue("Short_Name_Org", orgModelForUpdate.SharedVariable);
                    SelectForUpdatecomm.Parameters.AddWithValue("Full_Name_Org", orgModelForUpdate.FullNameOrg);
                    sqlDataReader = SelectForUpdatecomm.ExecuteReader();
                }

                if (sqlDataReader.HasRows != true)
                {
                    SelectForUpdatecomm.Cancel();
                    sqlDataReader.Close();
                    SelectForUpdatecomm = new SqlCommand("Select_For_Apdate", sqlConnection);
                    SelectForUpdatecomm.CommandType = CommandType.StoredProcedure;

                    SelectForUpdatecomm.Parameters.AddWithValue("UNP_Org", orgModelForUpdate.UNPOrg);
                    SelectForUpdatecomm.Parameters.AddWithValue("Short_Name_Org", orgModelForUpdate.ShortNameOrg);
                    SelectForUpdatecomm.Parameters.AddWithValue("Full_Name_Org", orgModelForUpdate.SharedVariable);
                    sqlDataReader = SelectForUpdatecomm.ExecuteReader();
                }

                if (sqlDataReader.HasRows != true)
                {
                    if (kontragent.OrgForUpdate == null || kontragent.PersForUpdate == null)
                        MessageBox.Show("Организация не найдена в базе данных", "Ошибка организации ", MessageBoxButton.OK, MessageBoxImage.Error);
                    return new KontragentModelUpdate();
                }

                int count = 0;
                while (sqlDataReader.Read())
                {
                    count += 1;

                    searchOrg.UNPOrg = Convert.ToString(sqlDataReader["UNP_Org"]);
                    searchOrg.ShortNameOrg = Convert.ToString(sqlDataReader["Short_Name_Org"]);
                    searchOrg.FullNameOrg = Convert.ToString(sqlDataReader["Full_Name_Org"]);
                    searchOrg.CreatedateOrg = Convert.ToDateTime(sqlDataReader["Create_date_Org"]);
                    searchOrg.CountyrOrg = Convert.ToString(sqlDataReader["Name_Country"]);
                    searchOrg.NameSection = Convert.ToString(sqlDataReader["Name_Section"]);

                    searchOrg.DescriptionOrg = Convert.ToString(sqlDataReader["Description_Org"]);
                    searchOrg.BrokerOpinion = Convert.ToString(sqlDataReader["Broker_Opinion"]);
                    searchOrg.SectionHeadOpinion = Convert.ToString(sqlDataReader["Section_Head_Opinion"]);
                    searchOrg.AuditorOpinion = Convert.ToString(sqlDataReader["Auditor_Opinion"]);

                    searchOrg.OwnershipOrg = Convert.ToBoolean(sqlDataReader["Ownership_Org"]);
                    searchOrg.TaxDebt = Convert.ToBoolean(sqlDataReader["Tax_Debt"]);
                    searchOrg.DebtsEnforcementDocuments = Convert.ToBoolean(sqlDataReader["Debts_Enforcement_Documents"]);
                    searchOrg.FalseBusiness = Convert.ToBoolean(sqlDataReader["False_Business"]);
                    searchOrg.SpecialRisc = Convert.ToBoolean(sqlDataReader["Special_Risc"]);
                    searchOrg.ExecuteProc = Convert.ToBoolean(sqlDataReader["Execute_Proc"]);
                    searchOrg.BankruptcyProc = Convert.ToBoolean(sqlDataReader["Bankruptcy_Proc"]);
                    searchOrg.LiquidationProc = Convert.ToBoolean(sqlDataReader["Liquidation_Proc"]);
                    searchOrg.Resident = Convert.ToBoolean(sqlDataReader["Resident"]);
                    searchOrg.BrokerClient = Convert.ToBoolean(sqlDataReader["Broker_Client"]);
                    searchOrg.PrevBrokerClient = Convert.ToBoolean(sqlDataReader["Prev_Broker_Client"]);
                    searchOrg.Tradingexperience = Convert.ToBoolean(sqlDataReader["Trading_experience"]);
                    searchOrg.Trader = Convert.ToBoolean(sqlDataReader["Trader"]);
                    searchOrg.Manufacturer = Convert.ToBoolean(sqlDataReader["Manufacturer"]);
                    searchOrg.FirstAccred = Convert.ToBoolean(sqlDataReader["First_Accred"]);
                    searchOrg.SecondAccred = Convert.ToBoolean(sqlDataReader["Second_Accred"]);
                    searchOrg.ExchengeTradingDisorders = Convert.ToBoolean(sqlDataReader["Exchenge_Trading_Disorders"]);
                    searchOrg.NegativData = Convert.ToBoolean(sqlDataReader["Negativ_Data"]);
                    searchPer.NegativDataPers = Convert.ToBoolean(sqlDataReader["Negativ_Data_Pers"]);
                    searchOrg.Reputation = Convert.ToBoolean(sqlDataReader["Reputation"]);
                    searchOrg.RiscLevel = Convert.ToInt32(sqlDataReader["Степень риска"]);
                    searchOrg.ForcedDeposite = Convert.ToBoolean(sqlDataReader["Forced_Deposite"]);

                    searchPer.СountryPers = Convert.ToString(sqlDataReader["Country_Pers"]);
                    searchPer.OwnerName = Convert.ToString(sqlDataReader["Owner_Name"]);
                    searchPer.HeadName = Convert.ToString(sqlDataReader["Head_Name"]);
                    searchPer.DescriptionPers = Convert.ToString(sqlDataReader["Description_Pers"]);
                    searchPer.PrevLiquidated = Convert.ToBoolean(sqlDataReader["Prev_Liquidated"]);
                    searchPer.PrevBankruptcy = Convert.ToBoolean(sqlDataReader["Prev_Bankruptcy"]);
                    searchPer.PrevStateDebt = Convert.ToBoolean(sqlDataReader["Prev_State_Debt"]);
                    searchPer.PrevTaxDebt = Convert.ToBoolean(sqlDataReader["Prev_Tax_Debt"]);
                    searchPer.PrevExecuteProc = Convert.ToBoolean(sqlDataReader["Prev_Execute_Proc"]);



                    /*
                                        if (Convert.ToString(reader_For_Update["Рекомендуемый вид задатка"]) == Convert.ToString(reader_For_Update["Вид задатка"]))
                                        {
                                            ORG.Forced_Deposite_Small = 0;
                                            ORG.Forced_Deposite_Large = 0;
                                        }

                                        if (Convert.ToString(reader_For_Update["Рекомендуемый вид задатка"]) != Convert.ToString(reader_For_Update["Вид задатка"]))
                                        {
                                            if (oRG.Sbor_Sdelka <= (Convert.ToInt32(reader_For_Update["Степень риска"])))
                                            {
                                                ORG.Forced_Deposite_Small = 1;
                                            }

                                            if (oRG.Sbor_Sdelka >= (Convert.ToInt32(reader_For_Update["Степень риска"])))
                                            {
                                                ORG.Forced_Deposite_Large = 1;
                                            }

                                        }

                    */

                    kontragent = new KontragentModelUpdate(searchOrg, searchPer);


                    if (count > 1)
                    {
                        MessageBox.Show($"По заданному параметру \"{orgModelForUpdate.SharedVariable}\" найдено более одной организации!\nДля избежания некорректного форматирования данных нпишите УНП или название организации более подробно.", "Ошибка организации ", MessageBoxButton.OK, MessageBoxImage.Error);
                        return new KontragentModelUpdate();
                    }
                }
               /* if (count == 1)
                {
                    MessageBox.Show($"{kontragent.OrgForUpdate.UNPOrg}\n {kontragent.OrgForUpdate.FullNameOrg}\n {kontragent.OrgForUpdate.ShortNameOrg}");
                }*/
                sqlDataReader.Close();
                sqlConnection.Close();
            }
            return kontragent;
        }
    }
}
