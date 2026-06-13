import 'package:mobile/_import.dart';

final class OnboardingRepo {
  static List<OnboardingItem> getData() {
    return [
      OnboardingItem(
        image: AppImage.onboarding_1,
        title: "Reserve hotéis, hospedarias e alojamentos",
        description:
            "Encontre e reserve o alojamento perfeito para cada ocasião. Compare disponibilidade, preços e comodidades em tempo real, com confirmação instantânea e total segurança na sua reserva",
      ),
      OnboardingItem(
        image: AppImage.onboarding_2,
        title: "Reserve mesas nos melhores restaurantes",
        description:
            "Garanta o seu lugar nos restaurantes favoritos sem espera e sem complicações. Escolha o horário, o número de pessoas e receba a confirmação diretamente no seu dispositivo",
      ),
    ];
  }
}
