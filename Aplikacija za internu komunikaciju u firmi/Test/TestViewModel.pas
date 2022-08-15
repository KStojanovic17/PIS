//---------------------------------------------------------------------------

// This software is Copyright (c) 2021 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestViewModel;

interface

uses
  DUnitX.TestFramework, ViewModel, Model.Data, SysUtils;

type
  // Test methods for class TViewModel.
  [TestFixture]
  TestTViewModel = class(TObject)
  private
    FViewModel: TViewModel;
  public
    // Test initialization entry point. Here you can prepare your environment and
    // initialize necessary class instances for the test.
    [Setup]
    procedure Setup;
    // Here you can release your necessary class instances.
    [TearDown]
    procedure TearDown;
    // Simple single Test.
    [Test]
    procedure TestGetTotalSumSales;
    // Simple single Test.
    [Test]
    procedure TestGetCustNoByUserName;
    // Simple single Test.
    [Test]
    procedure TestGetAddressLine1;
  end;

implementation

{ TestTViewModel }

procedure TestTViewModel.Setup;
begin
  FViewModel := TViewModel.Create;
end;

procedure TestTViewModel.TearDown;
begin
  FViewModel.Free;
  FViewModel := nil;
end;

procedure TestTViewModel.TestGetTotalSumSales;
var
  ExpectedTotalSumSales, ActualTotalSumSales: Integer;
const
  CUST_NO = 1003;
  TOTAL_SUM_SALES = 39582;
begin
  // Call the tested method.
  ActualTotalSumSales := FViewModel.GetTotalSumSales(CUST_NO);
  // Validate method results.
  // Check the total sum sales.
  ExpectedTotalSumSales := TOTAL_SUM_SALES;
  Assert.AreEqual(ExpectedTotalSumSales, ActualTotalSumSales, 'A wrong total sum sales was received.');
end;

procedure TestTViewModel.TestGetCustNoByUserName;
var
  ExpectedCustNo, ActualCustNo: Integer;
const
  USER_NAME = 'James';
  CUST_NO = 1003;
begin
  // Call the tested method.
  ActualCustNo := FViewModel.GetCustNoByUserName(USER_NAME);
  // Validate method results.
  // Check the customer number.
  ExpectedCustNo := CUST_NO;
  Assert.AreEqual(ExpectedCustNo, ActualCustNo, 'An invalid customer number was received.');
end;

procedure TestTViewModel.TestGetAddressLine1;
var
  ExpectedAddressLine, ActualAddressLine: string;
const
  USER_NAME = 'James';
  ADDRESS_LINE = '2300 Newbury Street';
begin
  // Call the tested method.
  ActualAddressLine := FViewModel.GetAddressLine1(USER_NAME);
  // Validate method results.
  // Check the address line.
  ExpectedAddressLine := ADDRESS_LINE;
  Assert.AreEqual(QuotedStr(ExpectedAddressLine), QuotedStr(ActualAddressLine), 'An invalid address line was received.');
end;

initialization
  // Register any test cases with the test runner.
  TDUnitX.RegisterTestFixture(TestTViewModel);

end.
