package model;

public class KakaoProfile {
	public Integer id;
	public String connected_at;
	public Properties properties;
	public KakaoAccount kakao_account;

	public KakaoProfile() {}

	public KakaoProfile(Integer id, String connected_at, Properties properties, KakaoAccount kakao_account) {
		super();
		this.id = id;
		this.connected_at = connected_at;
		this.properties = properties;
		this.kakao_account = kakao_account;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getConnectedAt() {
		return connected_at;
	}

	public void setConnectedAt(String connected_at) {
		this.connected_at = connected_at;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public KakaoAccount getKakaoAccount() {
		return kakao_account;
	}

	public void setKakaoAccount(KakaoAccount kakao_account) {
		this.kakao_account = kakao_account;
	}

	@Override
	public String toString() {
		return "KakaoProfile [id=" + id + ", connected_at=" + connected_at + ", properties=" + properties
				+ ", kakao_account=" + kakao_account + "]";
	}

	public class Properties {
		public String nickname;
		public String profile_image;
		public String thumbnail_image;

		public Properties() {}

		public Properties(String nickname, String profile_image, String thumbnail_image) {
			super();
			this.nickname = nickname;
			this.profile_image = profile_image;
			this.thumbnail_image = thumbnail_image;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public String getProfileImage() {
			return profile_image;
		}

		public void setProfileImage(String profile_image) {
			this.profile_image = profile_image;
		}

		public String getThumbnailImage() {
			return thumbnail_image;
		}

		public void setThumbnailImage(String thumbnail_image) {
			this.thumbnail_image = thumbnail_image;
		}

		@Override
		public String toString() {
			return "Properties [nickname=" + nickname + ", profile_image=" + profile_image + ", thumbnail_image="
					+ thumbnail_image + "]";
		}

	}

	public class KakaoAccount {
		public Boolean profile_needs_agreement;
		public Profile profile;
		public Boolean has_age_range;
		public Boolean age_range_needs_agreement;
		public String age_range;
		public Boolean has_gender;
		public Boolean gender_needs_agreement;

		public KakaoAccount() {}

		public KakaoAccount(Boolean profile_needs_agreement, Profile profile, Boolean has_age_range,
				Boolean age_range_needs_agreement, String age_range, Boolean has_gender, Boolean gender_needs_agreement) {
			super();
			this.profile_needs_agreement = profile_needs_agreement;
			this.profile = profile;
			this.has_age_range = has_age_range;
			this.age_range_needs_agreement = age_range_needs_agreement;
			this.age_range = age_range;
			this.has_gender = has_gender;
			this.gender_needs_agreement = gender_needs_agreement;
		}

		public Boolean getProfileNeedsAgreement() {
			return profile_needs_agreement;
		}

		public void setProfileNeedsAgreement(Boolean profile_needs_agreement) {
			this.profile_needs_agreement = profile_needs_agreement;
		}

		public Profile getProfile() {
			return profile;
		}

		public void setProfile(Profile profile) {
			this.profile = profile;
		}

		public Boolean getHasAgeRange() {
			return has_age_range;
		}

		public void setHasAgeRange(Boolean has_age_range) {
			this.has_age_range = has_age_range;
		}

		public Boolean getAgeRangeNeedsAgreement() {
			return age_range_needs_agreement;
		}

		public void setAgeRangeNeedsAgreement(Boolean age_range_needs_agreement) {
			this.age_range_needs_agreement = age_range_needs_agreement;
		}

		public String getAgeRange() {
			return age_range;
		}

		public void setAgeRange(String age_range) {
			this.age_range = age_range;
		}

		public Boolean getHasGender() {
			return has_gender;
		}

		public void setHasGender(Boolean has_gender) {
			this.has_gender = has_gender;
		}

		public Boolean getGenderNeedsAgreement() {
			return gender_needs_agreement;
		}

		public void setGenderNeedsAgreement(Boolean gender_needs_agreement) {
			this.gender_needs_agreement = gender_needs_agreement;
		}

		@Override
		public String toString() {
			return "KakaoAccount [profile_needs_agreement=" + profile_needs_agreement + ", profile=" + profile
					+ ", has_age_range=" + has_age_range + ", age_range_needs_agreement=" + age_range_needs_agreement
					+ ", age_range=" + age_range + ", has_gender=" + has_gender + ", gender_needs_agreement="
					+ gender_needs_agreement + "]";
		}

		public class Profile {
			public String nickname;
			public String thumbnail_image_url;
			public String profile_image_url;

			public Profile() {}

			public Profile(String nickname, String thumbnail_image_url, String profile_image_url) {
				super();
				this.nickname = nickname;
				this.thumbnail_image_url = thumbnail_image_url;
				this.profile_image_url = profile_image_url;
			}

			public String getNickname() {
				return nickname;
			}

			public void setNickname(String nickname) {
				this.nickname = nickname;
			}

			public String getThumbnailImageUrl() {
				return thumbnail_image_url;
			}

			public void setThumbnailImageUrl(String thumbnail_image_url) {
				this.thumbnail_image_url = thumbnail_image_url;
			}

			public String getProfileImageUrl() {
				return profile_image_url;
			}

			public void setProfileImageUrl(String profile_image_url) {
				this.profile_image_url = profile_image_url;
			}

			@Override
			public String toString() {
				return "Profile [nickname=" + nickname + ", thumbnail_image_url=" + thumbnail_image_url + ", profile_image_url="
						+ profile_image_url + "]";
			}
		}
	}
	
}


