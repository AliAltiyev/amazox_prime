<h1 align="center" id="title">Amazox Prime</h1>

<p align="center"><img src="https://firebasestorage.googleapis.com/v0/b/innofire-ccce6.appspot.com/o/Screenshot%202023-06-27%20130937.png?alt=media&amp;token=9f95ee4d-4da1-4f72-a99e-1fc92c63b560" alt="project-image"></p>

<p id="description">This project is a Flutter app that uses Firebase services to help users find and book repair appointments for their cars or order food.</p>

  
  
<h2>🧐 Gitflow </h2>

Branches: master/feature/PT-1/setup project

  
<h2>💻 Architecture </h2>

*   Clean Architecture + BloC
*   Dependency Injection: GetIt
*   Domain layer: models, repositories, use-cases.
*   Data layer: entities, mappers from entities to domain model, implementations of 
    repositories and providers.
*   Presentation layer: screens + bloc


<h2>🛡️ Supported flavors </h2>

 *  dev


<h2>🪓 Project structure </h2>

<h3> Modules </h3>
 
 *  core
 
 *  core_ui
 
 *  navigation
 
 *  data
 
 *  domain
 
 *  For presentation layer every feature is a separate module.

<h2>⏳ Asynchrony support </h2>

 *  Flutter Async

<h2> 📑 Abstractions for data sources and data access </h2>

* Providers are responsible for specific services (e.g. http provider, local provider, etc.),
they use data layer entities. Do not have abstract base classes.
Repositories are responsible for gathering data from providers
and mapping it to the corresponding domain layer models. Have abstract base classes in domain layer.

<h2> 🐿️ Presentation layer abstractions </h2>

* Base and frequently used widgets are stored in core_ui module.
Base widget for screens is AppScaffold.
Example: CustomScreen -> CustomForm
Navigation is implemented using Auto Route
Navigation on BLoC event is done from the BLoC object itself without BuildContext,
router is stored in DI container and is injected in BLoC via constructor.


<h2> 🐧 Approach for working with UI </h2>

* One file = one widget.
* Screen widget contains BlocProviders.


<h2> 🌍 Localization </h2>

* Localization is implemented using EasyLocalization service.


<h2> 🎨 Design system  </h2>

* Fonts, colors, frequently used constant values, and icons are stored in core_ui 
  module.

<h2> 📲 Supported platforms  </h2>

* Mobiles - Android and IOS
 

   
