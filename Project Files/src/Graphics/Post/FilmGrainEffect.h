#pragma once

#include "Graphics/Post/PostEffect.h"

class FilmGrainEffect : public PostEffect
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
	float _intensity = 500.0f;
};