#pragma once

#include "Graphics/Post/PostEffect.h"

class PixelationEffect : public PostEffect
{
public:
	//Initializes framebuffer
	void Init(unsigned width, unsigned height) override;

	//Applies effect to this buffer
	void ApplyEffect(PostEffect* buffer) override;

	//Getters
	float GetIntensity() const;

	//Setters
	void SetIntensity(float intensity);

private:
	float _intensity = 0.75f;
};