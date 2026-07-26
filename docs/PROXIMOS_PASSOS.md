# Roteiro de evolução do app

A estrutura de pastas já está pronta para crescer sem bagunçar o projeto:

```
lib/
  core/            -> tema, constantes, coisas transversais
  models/          -> classes de dados (ex: CountdownData)
  services/        -> regras de negócio e integrações (ex: CountdownService)
  screens/         -> uma tela por arquivo
  widgets/         -> componentes visuais reutilizáveis
```

Sugestão de próximas funcionalidades, cada uma isolada em sua própria tela/serviço:

| Funcionalidade                | Sugestão de arquivos                                   |
|--------------------------------|----------------------------------------------------------|
| Foto do casal                  | `screens/photo_screen.dart`, asset em `assets/images/`  |
| Galeria de momentos            | `models/moment.dart`, `services/gallery_service.dart`, `screens/gallery_screen.dart` |
| Datas importantes              | `models/important_date.dart`, `services/dates_service.dart` |
| Aniversário de casamento       | reaproveita `CountdownService` com uma nova data alvo    |
| Lista de tarefas do casal      | `models/task.dart`, `services/tasks_service.dart`, `screens/tasks_screen.dart` |
| Controle financeiro simples    | `models/expense.dart`, `services/finance_service.dart`  |
| Plano de leitura bíblica       | `models/reading_plan.dart`, `services/reading_service.dart` |
| Viagens                        | `models/trip.dart`, `screens/trips_screen.dart`          |
| Metas do casal                 | `models/goal.dart`, `screens/goals_screen.dart`          |

Para navegação entre telas, quando houver mais de uma, o mais simples é
trocar `home: const HomeScreen()` em `lib/main.dart` por uma navegação
com `Navigator` ou um `BottomNavigationBar`/`NavigationBar` com as
telas principais (Início, Galeria, Tarefas, Finanças, etc).

Persistência: para dados simples (tarefas, metas, datas), `shared_preferences`
(já incluso) resolve. Se o app crescer muito, migrar para `sqflite` ou
`hive` é o próximo passo natural.
