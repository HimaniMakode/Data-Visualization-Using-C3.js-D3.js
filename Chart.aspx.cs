using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using table1.table1.Datasets.DemographicsChartsDatasetTableAdapters;

namespace table1.table1.Home
{
    public partial class GetDemographicsChartData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserActivityLog.SaveUserActivity(ActivityCode.Read);
            string chartType = Request.QueryString["chartType"];
            string returnValue = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Clear();
            Response.ClearContent();
            Response.ClearHeaders();
            Response.ContentType = "application/json";
            Response.BufferOutput = true;

            string userRoles = ((table1.Nestedtable1)Page.Master).GetUserRoles();

            if (chartType == "1")
            {
                CountPerStudyTableAdapter CountPerStudyTableAdapter = new CountPerStudyTableAdapter();
                Datasets.DemographicsChartsDataset.CountPerStudyDataTable table = CountPerStudyTableAdapter.GetData(userRoles);
                foreach (Datasets.DemographicsChartsDataset.CountPerStudyRow row in table.Rows)
                {
                    string item = "{\"TCH\":\"" + row.TCHCount.ToString() + "\",\"Total Enrollment\":\"" + row.TotalEnrollment.ToString() + "\",\"EnrollmentYearMonth\":\"" + (row.IsEnrollmentYearMonthNull() ? "null" : row.EnrollmentYearMonth) + "\"}";
                    returnValue = returnValue + "," + item;
                }
            }
            if (chartType == "6")
            {
                CountArmTableAdapter CountArmTableAdapter = new CountArmTableAdapter();
                Datasets.DemographicsChartsDataset.CountArmDataTable table = CountArmTableAdapter.GetData(userRoles);
                foreach (Datasets.DemographicsChartsDataset.CountArmRow row in table.Rows)
                {
                    string item = "{\"Arm\":\"" + row.ArmText + "\",\"Count\":\"" + row.ArmCount.ToString() + "\"}";
                    returnValue = returnValue + "," + item;
                }
            }
            if (chartType == "2")
            {
                    CountGenderTableAdapter CountGenderTableAdapter = new CountGenderTableAdapter();
                    Datasets.DemographicsChartsDataset.CountGenderDataTable table = CountGenderTableAdapter.GetData(userRoles);
                    foreach (Datasets.DemographicsChartsDataset.CountGenderRow row in table.Rows)
                    {
                        string item = "{\"Gender\":\"" + row.GenderText + "\",\"Count\":\"" + row.GenderCount.ToString() + "\"}";
                        returnValue = returnValue + "," + item;
                    }             
            }
            if (chartType == "3")
            {
                CountStudyTableAdapter CountStudyTableAdapter = new CountStudyTableAdapter();
                Datasets.DemographicsChartsDataset.CountStudyDataTable table = CountStudyTableAdapter.GetData(userRoles);
                foreach (Datasets.DemographicsChartsDataset.CountStudyRow row in table.Rows)
                {
                    string item = "{\"Study Site\":\"" + row.StudyText + "\",\"Count\":\"" + row.COECount.ToString() + "\"}";
                    returnValue = returnValue + "," + item;
                }
            }
            if (chartType == "4")
            {
                CountRaceTableAdapter CountRaceTableAdapter = new CountRaceTableAdapter();
                Datasets.DemographicsChartsDataset.CountRaceDataTable table = CountRaceTableAdapter.GetData(userRoles);
                foreach (Datasets.DemographicsChartsDataset.CountRaceRow row in table.Rows)
                {
                    string item = "{\"Race\":\"" + row.RaceText + "\",\"Count\":\"" + row.RaceCount.ToString() + "\"}";
                    returnValue = returnValue + "," + item;
                }
            }
            if (chartType == "5")
            {
                CountEthnicityTableAdapter CountEthnicityTableAdapter = new CountEthnicityTableAdapter();
                Datasets.DemographicsChartsDataset.CountEthnicityDataTable table = CountEthnicityTableAdapter.GetData(userRoles);
                foreach (Datasets.DemographicsChartsDataset.CountEthnicityRow row in table.Rows)
                {
                    string item = "{\"Ethnicity\":\"" + row.EthnicityText + "\",\"Count\":\"" + row.EthnicityCount.ToString() + "\"}";
                    returnValue = returnValue + "," + item;
                }
            }
            returnValue = returnValue.Length > 0 ? returnValue.Substring(1) : returnValue;
            returnValue = "[" + returnValue + "]";
            Response.Write(returnValue);
            Response.Flush();
            Response.End();
        }
    }
}
