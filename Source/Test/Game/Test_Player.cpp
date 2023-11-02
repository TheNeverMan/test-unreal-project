// Fill out your copyright notice in the Description page of Project Settings.


#include "Test_Player.h"
#include "GameFramework/SpringArmComponent.h"
#include "Camera/CameraComponent.h"
// Sets default values
ATest_Player::ATest_Player()
{
 	// Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = false;

	Mesh = CreateDefaultSubobject<UStaticMeshComponent>("Mesh");
	SpringArm = CreateDefaultSubobject<USpringArmComponent>("SpringArm");
	Camera = CreateDefaultSubobject<UCameraComponent>("Camera");

	RootComponent = Mesh;
	SpringArm->SetupAttachment(Mesh);
	Camera->SetupAttachment(SpringArm);
	Mesh->SetSimulatePhysics(true);
}

// Called when the game starts or when spawned
void ATest_Player::BeginPlay()
{
	Super::BeginPlay();
}

// Called every frame
void ATest_Player::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
	LocalDeltaTime = DeltaTime;
}

// Called to bind functionality to input
void ATest_Player::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);
	InputComponent->BindAxis("MoveForward", this, &ATest_Player::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &ATest_Player::MoveRight);
	InputComponent->BindAction("Jump", IE_Pressed, this, &ATest_Player::Jump);

}

void ATest_Player::MoveRight(float Value)
{
	FVector NewLocation = GetActorLocation();
	NewLocation.Y += MoveForce * Value * MainApp.GetDeltaTime();
	SetActorLocation(NewLocation);
}

void ATest_Player::MoveForward(float Value)
{
		FVector NewLocation = GetActorLocation();
		NewLocation.X += MoveForce * Value * MainApp.GetDeltaTime();
		SetActorLocation(NewLocation);
}

void ATest_Player::Jump()
{
	if(JumpCount)
		return;
	Mesh->AddImpulse(FVector(0,0,JumpImpulse));
	JumpCount++;
}
