//---------------------------------------------------------------------------

// This software is Copyright (c) 2021 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestModel;

interface

uses
  DUnitX.TestFramework, Model;

type
  // Test methods for class TModel.
  [TestFixture]
  TestTModel = class(TObject)
  private
    FModel: TModel;
  public
    // Test initialization entry point. Here you can prepare your environment and
    // initialize necessary class instances for the test.
    [Setup]
    procedure Setup;
    // Here you can release your necessary class instances.
    [TearDown]
    procedure TearDown;
    // Simple single Test.
    // You can define as many tests as you need here. Each method is equal to
    // single unit test.
    //[Test]
    procedure TestExecSQLCommand;
  end;

implementation

procedure TestTModel.Setup;
begin
  FModel := TModel.Create;
end;

procedure TestTModel.TearDown;
begin
  FModel.Free;
  FModel := nil;
end;

procedure TestTModel.TestExecSQLCommand;
var
  ReturnValue: Variant;
  AParamName: string;
  AFieldName: string;
  ASQLCommand: string;
  AValue: Variant;
begin
  // TODO: Setup method call parameters.
  // You can write here your own logic for the unit test. You can create couple
  // tests with different input/call parameters.
  // For now logic is empty, because you have to write your own unit test
  // implementation. FireMonkey App Template uses demo employee.gdb. You should
  // use an example and implement your own data access layer.
  ReturnValue := FModel.ExecSQLCommand(AValue, ASQLCommand, AFieldName, AParamName);
  // TODO: Validate method results.

  {
    // Test logic implementation example:

    // Specify variables for expected result value and tested method result.
    var ExpectedValue, Result: Integer;
    try
      // Executes some method with some input parameters and get the result.
      ReturnValue := FModel.ExecSQLCommand(1, 'SELECT COUNT(*) AS RECORD_COUNT FROM SALES WHERE 1 = :Value', 'RECORD_COUNT', 'Value');
    except
      on E: Exception do
        // Throw and exeption. DUnitX will handle it as a failed unit test.
        Assert.Fail(Format('Failed to execute the SQL query. Exeption: %s', [E.Message]));
    end;
    // Some expected value.
    ExpectedValue := 0;
    // Compare result and expected value and throw an exeption if not equal.
    // Throw and exeption. DUnitX will handle it as a failed unit test.
    Assert.AreEqual(ExpectedValue, ReturnValue, 'Test TestExecSQLCommand has not passed.!');
  }
end;

initialization
  // Register any test cases with the test runner (register for DUnitX framework).
  TDUnitX.RegisterTestFixture(TestTModel);

end.

