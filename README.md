# Links úteis

# Sumário

## **IOS**

### **Pods**

- [Facebook](#Facebook)
- [Firebase](#Firebase)
	- [Adicionar firebase ao projeto](#Adicionar)
	- [Estruturar e consultar - Realtime Database](#Query)
	- [Criação de regras](#Regras)
	- [Cloud functions](#Cloud)
	- [Push Notification](#Push)
	- [Development and production database](#DevAndProd)
- [Kingfisher - download e cache de imagens](#Kingfisher)
- [Sourcery](#Sourcery)
- [SwiftGen](#SwiftGen)
- [PromiseKit](#PromiseKit)
- [OpenCV](#OpenCV)
- [Tesseract](#Tesseract)
- [Nimble, Quick](#Tests)
- [Cartography](#Cartography)
- [Swiftlint](#Swiftlint)

### **Native frameworks**

- [CloudKit](#Cloudkit)
- [HealthKit](#HealthKit)
- [In-app purchase](#In-app)

### **Swift**

- [Codable e Decodable - Swift 4](#Codable)
- [Textfield e teclado](#Textfield)
	- [Adicionar observer](#Observer)
	- [mover para o próximo text field](#NextField)

### **Outros**

- [Realm](#Realm)
- [Publicação e atualização de app](#Publicação)
- [Swift guidelines for naming](#Naming)

## **Android**

- [Console](#ConsoleAndroid)
- [In-app purchase](#In-appAndroid)
- [Release / test](#ReleaseAndroid)
- [Tutorial específico](Android/README.md)

## **Spring boot**

- [PostgreSQL - Instalação](#Instalação)
- [Tutoriais específicos](#Tutoriais)

## **Markdown**

- [Markdown](#Markdown)

# IOS

<a name="Facebook"></a>
## Facebook

- Enviar convite por facebook
	- [Tutorial](http://swiftdeveloperblog.com/code-examples/invite-facebook-friends-code-example-in-swift/)

<a name="Firebase"></a>
## Firebase

<a name="Adicionar"></a>
### Adicionar firebase ao projeto

- [Documentação](https://firebase.google.com/docs/ios/setup?hl=pt-br) (Ir em "Adicionar o Firebase ao seu app" e seguir as instruções)

<a name="Query"></a>
### Estruturar e consultar - Realtime Database

- [Vídeo tutoriais - Firebase for SQL developers](https://www.youtube.com/watch?v=WacqhiI-g_o&list=PLl-K7zZEsYLlP-k-RKFa7RyNPa9_wCH2s)

<a name="Regras"></a>
### Criação de regras

- [Vídeo tutorial completo](https://www.youtube.com/watch?v=PUBnlbjZFAI&frags=pl%2Cwn)

<a name="Cloud"></a>
### Cloud functions

- Criar e fazer deploy de cloud functions

	 - [Video tutorial](https://www.youtube.com/watch?v=NIGUpxJloj8&frags=pl%2Cwn) (ver primeiros minutos principalmente)

<a name="Push"></a>
### Push Notification

- Gerar certificado e subir no firebase

	- [Gerar certificado .p8](https://developer.clevertap.com/docs/how-to-create-an-ios-apns-auth-key)

	- [Subir certificado no firebase](https://androapp.mobi/blog/upload-apn-auth-keys-firebase-project/402)

- Implementar no app

	- [Configurando e recebendo notificações](http://swiftdeveloperblog.com/push-notifications-firebase-cloud-messaging-cheat-sheet/)

- Implementar nas cloud functions

	- [Video tutorial](https://www.youtube.com/watch?v=NIGUpxJloj8&frags=pl%2Cwn)

- Formato do payload:

```javascript
const payload = {
    notification: { // campos padrões
        title: `Nova notificação`,
        body: `Clique para conferir`,
        badge: `1`,
        sound: `default`
    },
    data: {
    	 // passar campos extras aqui (como dicionário)
    }
}
```

<a name="DevAndProd"></a>
### Development and production database

- [Tutorial](https://medium.com/rocket-fuel/using-multiple-firebase-environments-in-ios-12b204cfa6c0)

<a name="Kingfisher"></a>
## Kingfisher - download e cache de imagens

Kingfisher faz o download e cache de imagens a partir de uma URL.

Instalação com cocoapods:

```
pod 'Kingfisher', '~> 4.0'
```

Uso básico

``` swift
let url = URL(string: "url_of_your_image")

// downloads and sets the image in a imageView
imageView.kf.setImage(with: url)

// setting a placeholder image while downloading
let image = UIImage(named: "default_profile_icon")
imageView.kf.setImage(with: url, placeholder: image)

// loading indicator while downloading
imageView.kf.indicatorType = .activity
imageView.kf.setImage(with: url)
```

[Saber mais](https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet)

<a name="Sourcery"></a>
## Sourcery

- Muito útil para gerar todos arquivos de uma arquitetura para uma funcionalidade em seu projeto.
- brew install sourcery
- pod 'Sourcery'
- [Sourcery-Github](https://github.com/krzysztofzablocki/Sourcery)
- [Tutorial](https://www.raywenderlich.com/501-sourcery-tutorial-generating-swift-code-for-ios)

<a name="SwiftGen"></a>
## SwiftGen

- [SwiftGen - Github](https://github.com/SwiftGen/SwiftGen)

<a name="PromiseKit"></a>
## PromiseKit

- [PromiseKit - Github](https://github.com/mxcl/PromiseKit)
- [Tutorial](https://www.raywenderlich.com/786-getting-started-with-promisekit)

<a name="OpenCV"></a>
## OpenCV

- [OpenCV](https://opencv.org)
- [Tutorial](https://medium.com/@borisohayon/ios-opencv-and-swift-1ee3e3a5735b)
- Olhar também tutorial dentro desse mesmo repositório através do [link]()

<a name="Tesseract"></a>
## Tesseract

- [Tutorial](https://www.raywenderlich.com/306-tesseract-ocr-tutorial-for-ios)

<a name="Tests"></a>
## Nimble, Quick

- [Quick - Github](https://github.com/Quick)
- Nesse link também se encontram o github do Nimble

<a name="Cartography"></a>
## Cartography

- Pod que facilita a escrita de constraints por código
- [Cartography - Github](https://github.com/robb/Cartography)

<a name="Swiftlint"></a>
## Swiftlint

- Pod extremamente útil para padronização e limpeza de código
- [Swiftlint - Github](https://github.com/realm/SwiftLint)
- [Rules](https://github.com/realm/SwiftLint/blob/master/Rules.md)

<a name="Cloudkit"></a>
## CloudKit

- Procurar vídeos WWDC
- [Documentação](https://developer.apple.com/library/archive/documentation/General/Conceptual/iCloudDesignGuide/DesigningforCloudKit/DesigningforCloudKit.html#//apple_ref/doc/uid/TP40012094-CH9-SW1)
- Production
	- [Mudar para o modo de produção no xcode](https://stackoverflow.com/questions/30182521/use-production-cloudkit-during-development)
	- [Testar cloudkit](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/CloudKitQuickStart/TestingYourApp/TestingYourApp.html#//apple_ref/doc/uid/TP40014987-CH9)
	- [Deploy](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/CloudKitQuickStart/DeployingYourCloudKitApp/DeployingYourCloudKitApp.html#//apple_ref/doc/uid/TP40014987-CH10)

<a name="HealthKit"></a>
## HealthKit

- [Configurações iniciais, busca de informação e criação de dados](https://www.raywenderlich.com/459-healthkit-tutorial-with-swift-getting-started)
- [Criando, buscando e salvando workouts](https://www.raywenderlich.com/458-healthkit-tutorial-with-swift-workouts)

<a name="In-app"></a>
## In-app purchase

- Tutoriais de um primeiro cara
	- [Vídeo tutorial](https://www.youtube.com/watch?v=dwPFtwDJ7tc)
- Tutoriais de um segundo cara
	- [Vídeo tutorial](https://www.youtube.com/watch?v=Y6FkbZxVzNI)
	- [Vídeo tutorial](https://www.youtube.com/watch?v=tniBAyrNI0k)
- Pod swift StoreKit
	- [documentação](https://github.com/bizz84/SwiftyStoreKit)

<a name="Codable"></a>
## Codable e Decodable - Swift 4

- [Explicação completa](https://hackernoon.com/everything-about-codable-in-swift-4-97d0e18a2999)


<a name="Textfield"></a>
## Textfield e teclado

<a name="Observer"></a>

- [Adicionar observer](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)

<a name="NextField"></a>

- [mover para o próximo text field](https://medium.com/swift2go/swift-move-to-the-next-uitextfield-by-hitting-return-c3ce44ee9591)

<a name="Publicação"></a>
## Publicação e atualização de app

- [Vídeo tutorial de publicação](https://www.youtube.com/watch?v=tnbOcpwJGa8)
- [Vídeo tutorial de atualização do app](https://www.youtube.com/watch?v=kggtfVoQwIo)

<a name="Realm"></a>
## Realm

- [Vídeo tutorial](https://youtu.be/hC6dLLbfUXc)

<a name="Naming"></a>
## Swift guidelines for naming

- [Naming - swift](https://swift.org/documentation/api-design-guidelines/#naming)

# Android

<a name="ConsoleAndroid"></a>
## Console
- [Console](https://play.google.com/apps/publish/?account=6586043394320681662)

<a name="In-appAndroid"></a>
## In-app purchase

- Implementação
	- [Vídeo tutorial](https://www.youtube.com/watch?v=KBcOjMI6WVo)
- Teste
	- [Tutorial](https://developer.android.com/google/play/billing/billing_testing.html#testing-purchases)

<a name="ReleaseAndroid"></a>
## Release / test

- [Tutorial](https://support.google.com/googleplay/android-developer/answer/7159011)

<a name="Spring"></a>
# Springboot

<a name="Instalação"></a>
## PostgreSQL - Instalação

- iOS: Usar brew install postgres e depois baixar o pgadmin
- Linux:
	- [Vídeo tutorial](https://www.youtube.com/watch?v=-LwI4HMR_Eg)

<a name="Tutoriais"></a>
## Tutoriais específicos

- [Parte 1](https://github.com/AlexandreMestre/SpringTutorial)
- [Parte 2](https://github.com/AlexandreMestre/SpringTutorial/blob/master/postgresTutorial/PostgreSQL.md)

<a name="Markdown"></a>
# Markdown

- [Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
