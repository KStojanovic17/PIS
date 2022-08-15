//---------------------------------------------------------------------------

// This software is Copyright (c) 2021 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestModel.Types;

interface

uses
  DUnitX.TestFramework, Model.Types, FMX.Graphics;

type
  // Test methods for class TUserSettings.
  [TestFixture]
  TestTUserSettings = class(TObject)
  private
    FUserSettings: TUserSettings;
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
    [Test]
    procedure TestDeSerialize;
    // Simple single Test.
    [Test]
    procedure TestSeriazlize;
    // Simple single Test.
    [Test]
    procedure TestSignUp;
    // Simple single Test.
    [Test]
    procedure TestSignIn;
  end;

implementation

procedure TestTUserSettings.Setup;
begin
  FUserSettings := TUserSettings.Create;
end;

procedure TestTUserSettings.TearDown;
begin
  FUserSettings.Free;
  FUserSettings := nil;
end;

procedure TestTUserSettings.TestDeSerialize;
begin
  // Check an example below (TestSignUp method).
  FUserSettings.DeSerialize;
  // TODO: Validate method results.
end;

procedure TestTUserSettings.TestSeriazlize;
begin
  // Check an example below (TestSignUp method).
  FUserSettings.Serialize;
  // TODO: Validate method results.
end;

{$HINTS OFF}
{$WARNINGS OFF}
procedure TestTUserSettings.TestSignUp;
var
  ReturnValue: Integer;
  LUserPictute: TBitmap;
  LPassword: string;
  LLastName: string;
  LFirstName: string;
  LEmail: string;
begin
  // TODO: Setup method call parameters.
  // You can write here your own logic for the unit test. You can create couple
  // tests with different input/call parameters.
  // For now logic is empty, because you have to write your own unit test
  // implementation. FireMonkey App Template uses its own demo implementation
  // form SignUp method. You can use this example and implement your logic.
  ReturnValue := FUserSettings.SignUp(LEmail, LFirstName, LLastName, LPassword,
      LUserPictute);
  // TODO: Validate method results

  {
    // Test logic implementation example:

    // Specify variables for expected result value and tested method result.
    var ExpectedValue, Result: Integer;
    try
      // Executes some method with some input parameters and get the result.
      ReturnValue := FUserSettings.SignUp(LEmail, LFirstName, LLastName, LPassword,
        LUserPictute);
    except
      on E: Exception do
        // Throw and exeption. DUnitX will handle it as a failed unit test.
        Assert.Fail(Format('Failed to FUserSettings.SignUp. Exeption: %s', [E.Message]));
    end;
    // Some expected value.
    ExpectedValue := 0;
    // Compare result and expected value and throw an exeption if not equal.
    // Throw and exeption. DUnitX will handle it as a failed unit test.
    Assert.AreEqual(ExpectedValue, ReturnValue, 'Test TestSignUp has not passed!');
  }
end;
{$HINTS ON}
{$WARNINGS ON}

{$HINTS OFF}
{$WARNINGS OFF}
procedure TestTUserSettings.TestSignIn;
var
  ReturnValue: Boolean;
  APassword: string;
  AEmail: string;
begin
  // TODO: Setup method call parameters.
  // Check an example above (TestSignUp method).
  ReturnValue := FUserSettings.SignIn(AEmail, APassword);
  // TODO: Validate method results.
end;
{$HINTS ON}
{$WARNINGS ON}

initialization
  // Register any test cases with the test runner (register for DUnitX framework).
  TDUnitX.RegisterTestFixture(TestTUserSettings);

end.

