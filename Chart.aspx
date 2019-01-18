<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentForm" runat="server">
    <br />
    <br />
    <table class="table1">
        <tr>
            <td class="left">
                <asp:Label ID="InstructionLabel1" runat="server" Font-Size="Medium"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left">
                <asp:Label ID="InstructionLabel2" runat="server" Font-Size="Medium"></asp:Label>
            </td>
        </tr>
    </table>
     <br />
    <br />
 
    <div  style="width: 900px; text-align: left; padding-left: 20px;">
        <asp:Label ID="TotalEnrollmentNumberLabel" runat="server" Text="Total Enrollment: " Font-Size="Medium"></asp:Label>
        <asp:Label ID="TotalEnrollmentNumberLabel1" runat="server" OnPreRender="TotalEnrollmentNumberLabel1_PreRender" Font-Bold="true" Font-Size="Medium"></asp:Label>
    </div>       
    <br />
       <asp:Panel runat="server" ID="studysite" OnPreRender="ChartCOELabel_PreRender" >
    <div style="width: 900px; text-align: left; padding-left: 20px;" >
        <asp:Label ID="ChartCOELabel" runat="server" Text="Study Site" Font-Size="Medium" ></asp:Label>
    </div>
    <br />
    <br />
    <div class="chartCOE" style="height: 250px; width: 675px; text-align: left; padding-left: 20px;"></div>
            </asp:Panel>
     <div style="width: 900px; text-align: left; padding-left: 20px;">
        <asp:Label ID="ChartArmLabel" runat="server" Text="Arm" Font-Size="Medium"></asp:Label>
    </div>
    <br />
    <br />
    <div class="chartArm" style="height: 200px; width: 675px; text-align: left; padding-left: 20px;"></div>   
    <div style="width: 900px; text-align: left; padding-left: 20px;">
        <asp:Label ID="ChartGenderLabel" runat="server" Text="Gender" Font-Size="Medium"></asp:Label>
    </div>
    <br />
    <br />
    <div class="chartGender" style="height: 330px; width: 675px; text-align: left; padding-left: 20px;"></div>   
      <div style="width: 900px; text-align: left; padding-left: 20px;">
        <asp:Label ID="ChartRaceLabel" runat="server" Text="Race" Font-Size="Medium"></asp:Label>
    </div>
    <br />
    <br />
    <div class="chartRace" style="height: 450px; width: 900px; text-align: left; padding-left: 20px;"></div> 
    <div style="width: 900px; text-align: left; padding-left: 20px;">
        <asp:Label ID="ChartEthnicityLabel" runat="server" Text="Ethnicity" Font-Size="Medium"></asp:Label>
    </div>
    <br />
    <br />
    <div class="chartEthnicity" style="height: 350px; width: 900px; text-align: left; padding-left: 20px;"></div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            updateChart();
        });

        function updateChart() {
            showProcessingDialog();

            var chartArm = c3.generate({
                onrendered: function () { hideProcessingDialog(); },
                bindto: '.chartArm',
                data: {
                    url: 'GetDemographicsChartData.aspx?chartType=' + '6',
                    mimeType: 'json',
                    keys: {
                        x: 'Arm',
                        value: ['Count']
                    },
                    type: 'bar',
                    color: function (color, d) {
                        var newColor;
                        if (d.index === 0)
                            newColor = '#1F77B4';
                        if (d.index === 1)
                            newColor = '#FF7E0E';
                        if (d.index === 2)
                            newColor = '#2CA02C';
                        return newColor;
                    }
                },
                axis: {
                    rotated: true,
                    x: {
                        type: 'category',
                        label: {
                            //text: 'Gender',
                            position: 'outer-right'
                        }
                    },
                    y: {
                        label: {
                            text: 'Number of Patients',
                            position: 'outer-top'
                        },
                        tick: {
                            format: function (x) {
                                return (parseInt(x) == x) ? x : null;
                            }
                        }
                    }
                },
                legend: {
                    hide: true
                },
                bar: {
                    width: {
                        ratio: 0.3
                    }
                }
            });

            var chartGender = c3.generate({
                onrendered: function () { hideProcessingDialog(); },
                bindto: '.chartGender',
                data: {
                    url: 'GetDemographicsChartData.aspx?chartType=' + '2',
                    mimeType: 'json',
                    keys: {
                        x: 'Gender',
                        value: ['Count']
                    },
                    type: 'bar',
                    color: function (color, d) {
                        var newColor;
                        if (d.index === 0)
                            newColor = '#1F77B4';
                        if (d.index === 1)
                            newColor = '#FF7E0E';
                        if (d.index === 2)
                            newColor = '#2CA02C';
                        return newColor;
                    }
                },
                axis: {
                    rotated: true,
                    x: {
                        type: 'category',
                        label: {
                            //text: 'Gender',
                            position: 'outer-right'
                        }
                    },
                    y: {
                        label: {
                            text: 'Number of Patients',
                            position: 'outer-top'
                        },
                        tick: {
                            format: function (x) {
                                return (parseInt(x) == x) ? x : null;
                            }
                        }
                    }
                },
                legend: {
                    hide: true
                },
                bar: {
                    width: {
                        ratio: 0.3
                    }
                }
            });

            var chartCOE = c3.generate({
                onrendered: function () { hideProcessingDialog(); },
                bindto: '.chartCOE',
                data: {
                    url: 'GetDemographicsChartData.aspx?chartType=' + '3',
                    mimeType: 'json',
                    keys: {
                        x: 'Study Site',
                        value: ['Count']
                    },
                    type: 'bar',
                    color: function (color, d) {
                        var newColor;
                       if (d.index === 0)
                            newColor = '#1F77B4';
                        if (d.index === 1)
                            newColor = '#FF7E0E';
                        if (d.index === 2)
                            newColor = '#2CA02C';
                        if (d.index === 3)
                            newColor = '#D62728';
                        if (d.index === 4)
                            newColor = '#9467BD';
                        if (d.index === 5)
                            newColor = '#8C564B';
                        if (d.index === 6)
                            newColor = '#0000ff';
                        if (d.index === 7)
                            newColor = '#993300';
                         if (d.index === 8)
                            newColor = '#006699';
                        if (d.index === 9)
                            newColor = '#BD6767';
                        return newColor;
                    }
                },
                axis: {
                    rotated: true,
                    x: {
                        type: 'category',
                        label: {
                            //text: 'Study Site',
                            position: 'outer-right'
                        }
                    },
                    y: {
                        label: {
                            text: 'Number of Patients',
                            position: 'outer-top'
                        },
                        tick: {
                            format: function (x) {
                                return (parseInt(x) == x) ? x : null;
                            }
                        }
                    }
                },
                legend: {
                    hide: true
                },
                bar: {
                    width: {
                        ratio: 0.3
                    }
                }
            });
            var chartRace = c3.generate({
                onrendered: function () { hideProcessingDialog(); },
                bindto: '.chartRace',
                data: {
                    url: 'GetDemographicsChartData.aspx?chartType=' + '4',
                    mimeType: 'json',
                    keys: {
                        x: 'Race',
                        value: ['Count']
                    },
                    type: 'bar',
                    color: function (color, d) {
                        var newColor;
                        if (d.index === 0)
                            newColor = '#1F77B4';
                        if (d.index === 1)
                            newColor = '#FF7E0E';
                        if (d.index === 2)
                            newColor = '#2CA02C';
                        if (d.index === 3)
                            newColor = '#D62728';
                        if (d.index === 4)
                            newColor = '#9467BD';
                        if (d.index === 5)
                            newColor = '#8C564B';
                        if (d.index === 6)
                            newColor = '#0000ff';
                        if (d.index === 7)
                            newColor = '#993300';
                        if (d.index === 8)
                            newColor = '#006699';
                        if (d.index === 9)
                            newColor = '#BD6767';
                        if (d.index === 10)
                            newColor = '#67BDBA';
                        if (d.index === 11)
                            newColor = '#6e67BD';                      
                        return newColor;
                    }
                },
                axis: {
                    rotated: true,
                    x: {
                        type: 'category',
                        label: {
                            //text: 'Race',
                            position: 'outer-top'
                        }
                    },
                    y: {
                        label: {
                            text: 'Number of Patients',
                            position: 'outer-right'
                        },
                        tick: {
                            format: function (x) {
                                return (parseInt(x) == x) ? x : null;
                            }
                        }
                    }
                },
                legend: {
                    hide: true
                },
                bar: {
                    width: {
                        ratio: 0.3
                    }
                }
            });

            var chartEthnicity = c3.generate({
                onrendered: function () { hideProcessingDialog(); },
                bindto: '.chartEthnicity',
                data: {
                    url: 'GetDemographicsChartData.aspx?chartType=' + '5',
                    mimeType: 'json',
                    keys: {
                        x: 'Ethnicity',
                        value: ['Count']
                    },
                    type: 'bar',
                    color: function (color, d) {
                        var newColor;
                        if (d.index === 0)
                            newColor = '#1F77B4';
                        if (d.index === 1)
                            newColor = '#FF7E0E';
                        if (d.index === 2)
                            newColor = '#2CA02C';
                        if (d.index === 3)
                            newColor = '#D62728';
                        if (d.index === 4)
                            newColor = '#9467BD';
                        if (d.index === 5)
                            newColor = '#8C564B';
                        if (d.index === 6)
                            newColor = '#0000ff';
                        if (d.index === 7)
                            newColor = '#993300';
                        return newColor;
                    }
                },
                axis: {
                    rotated: true,
                    x: {
                        type: 'category',
                        label: {
                            //text: 'Ethnicity',
                            position: 'outer-top'
                        }
                    },
                    y: {
                        label: {
                            text: 'Number of Patients',
                            position: 'outer-right'
                        },
                        tick: {
                            format: function (x) {
                                return (parseInt(x) == x) ? x : null;
                            }
                        }
                    }
                },
                legend: {
                    hide: true
                },
                bar: {
                    width: {
                        ratio: 0.3
                    }
                }
            });
        }
    </script>
</asp:Content>
