// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "Misc/App.h"
#include "Test_Player.generated.h"

class USpringArmComponent;
class UCameraComponent;

UCLASS()
class TEST_API ATest_Player : public APawn
{
	GENERATED_BODY()

public:
	// Sets default values for this pawn's properties
	ATest_Player();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;
	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category="Components")
	UStaticMeshComponent* Mesh;
	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category="Components")
	USpringArmComponent* SpringArm;
	UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category="Components")
	UCameraComponent* Camera;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float MoveForce = 500.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float JumpImpulse = 1000.0f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	int32 JumpCount = 0;
	void MoveRight(float Value);
	void MoveForward(float Value);
	void Jump();
	float LocalDeltaTime = 0;
	FApp MainApp;
public:
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

};
