//---------------------------------------------------------------------------

// This software is Copyright (c) 2021 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit TestModel.Utils;

interface

uses
  DUnitX.TestFramework, Model.Utils;

type
  // Test methods for class TAppWizardImageLoader.
  [TestFixture]
  TAppWizardImageLoader = class(TObject)
  private
    FAppWizardImageLoader: TAppWizardImageLoader;
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
    procedure TestExec;
  end;

  // Test methods for class TAsyncFormRepainter.

  [TestFixture]
  TestTAsyncFormRepainter = class(TObject)
  private
    FAsyncFormRepainter: TAsyncFormRepainter;
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
    procedure TestStart;
    // Simple single Test.
    [Test]
    procedure TestStop;
  end;

implementation

procedure TAppWizardImageLoader.Setup;
begin
  FAppWizardImageLoader := TAppWizardImageLoader.Create;
end;

procedure TAppWizardImageLoader.TearDown;
begin
  FAppWizardImageLoader.Free;
  FAppWizardImageLoader := nil;
end;

procedure TAppWizardImageLoader.TestExec;
begin
  //FAppWizardImageLoader.Exec;
  // TODO: Validate method results.
end;

procedure TestTAsyncFormRepainter.Setup;
begin
  FAsyncFormRepainter := TAsyncFormRepainter.Create;
end;

procedure TestTAsyncFormRepainter.TearDown;
begin
  FAsyncFormRepainter.Free;
  FAsyncFormRepainter := nil;
end;

procedure TestTAsyncFormRepainter.TestStart;
begin
  FAsyncFormRepainter.Start;
  // TODO: Validate method results.
end;

procedure TestTAsyncFormRepainter.TestStop;
begin
  FAsyncFormRepainter.Stop;
  // TODO: Validate method results.
end;

initialization
  // Register any test cases with the test runner.
  TDUnitX.RegisterTestFixture(TAppWizardImageLoader);
  TDUnitX.RegisterTestFixture(TestTAsyncFormRepainter);

end.

