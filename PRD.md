# Product Requirements Document (PRD)

## 1. Introduction

### 1.1. Purpose
This document outlines the functional requirements for the Japanese vocabulary learning application. It is derived from the existing codebase to provide a clear reference for product managers and developers, detailing the application's features, user flows, and interaction logic.

### 1.2. Target Audience
- **Product Managers**: To understand the current product features and user experience.
- **Developers**: To have a clear reference of the implemented logic and guide future development.

## 2. User Flow

### 2.1. Main Navigation
The application uses a tab bar for primary navigation, allowing users to switch between four main sections:
- **Home**: Dashboard and entry point for learning activities.
- **Learn**: The core interface for studying new words and reviewing existing ones.
- **Word Bank**: A searchable and filterable repository of all vocabulary.
- **Profile**: User statistics, settings, and personal information.

### 2.2. Core Learning Loop
1.  **Start**: User begins on the **Home** page.
2.  **Action**: User taps "Start Learning" or "Review Mode".
3.  **Navigate**: Tapping "Start Learning" transitions to the **Learn** page. Tapping "Review Mode" attempts to navigate to a non-existent review page (a likely bug). The intended flow is to also go to the **Learn** page, but in its "Review" state.
4.  **Interact**: User studies a word and marks it as "Known" or "Unknown".
5.  **Cycle**: The app presents the next word.
6.  **Manage**: At any time, the user can visit the **Word Bank** to view their vocabulary, check progress, and filter by status.
7.  **Track**: The **Profile** page provides a summary of their learning progress and statistics.

---

## 3. Functional Requirements

### 3.1. Home Page (`pages/index/index`)
The Home page serves as a dashboard, providing a summary of the user's status and quick access to key learning activities.

| Feature                 | Description                                                                                             | User Interaction                                                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **User Greeting**       | Displays a time-sensitive greeting (e.g., "晚上好") and the user's name ("Alex") alongside their avatar. | None. This is a display-only component.                                                                          |
| **Notifications**       | A bell icon in the header.                                                                              | On click, should open a notifications view. Currently shows a "feature in development" toast.                    |
| **Learning Progress**   | A card showing today's progress (e.g., 15/20 new words) and a streak counter (e.g., "5 consecutive days"). | The progress bar visually represents the completion percentage. This is a display-only component.                |
| **Daily Word**          | A prominent card featuring a "Word of the Day" with its Japanese form, kana, definition, and an image.    | - **Play Sound**: A volume icon should play the pronunciation. Currently shows a "feature in development" toast. <br> - **View History**: A link to see past daily words. Currently shows a "feature in development" toast. |
| **Start Learning CTA**  | A primary action card that prompts the user to start learning new words. It displays the count of pending words. | On click, navigates the user to the `pages/learn/learn` page.                                                      |
| **Review Mode CTA**     | A secondary action card that prompts the user to review words. It displays the count of words needing review. | On click, the code attempts to navigate to a non-existent `/pages/review/review` page. The intended behavior is likely to navigate to the **Learn Page** with the "Review" mode tab selected. |

### 3.2. Learn Page (`pages/learn/learn`)
This is the core learning interface where users interact with flashcards.

| Feature               | Description                                                                                                         | User Interaction                                                                                                                              |
| --------------------- | ------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| **Mode Tabs**         | Tabs at the top allow switching between "Learn" and "Review" modes.                                                   | User can tap to switch modes. Currently, the UI is static and does not implement the mode-switching logic.                                  |
| **Progress Bar**      | A thin progress bar at the top displays the user's progress for the current session (e.g., 15/50).                    | Updates automatically as the user progresses through the words.                                                                               |
| **Word Card**         | A detailed card displaying the current word. It includes: an associated image, the word in Japanese (`木漏れ日`), its kana and accent (`こもれび [0]`), part of speech, definition, and an example sentence. | - **Play Sound**: A volume button next to the kana should play the pronunciation.<br>- **Bookmark**: A bookmark icon allows the user to save or favorite the word. |
| **Action Buttons**    | Two primary buttons at the bottom of the screen.                                                                    | - **"不认识" (Unknown)**: User clicks this if they don't know the word. The app should cycle to the next word and likely schedule this one for review.<br>- **"掌握" (Known)**: User clicks this to indicate they know the word. The app should cycle to the next word. |

### 3.3. Word Bank Page (`pages/word-bank/word-bank`)
This page allows users to browse, search, and manage their entire vocabulary.

| Feature               | Description                                                                                                    | User Interaction                                                                                                                             |
| --------------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| **Add Word**          | A "+" icon in the header.                                                                                      | On click, should open a view or modal for the user to manually add a new word to their word bank.                                           |
| **Search Bar**        | A text input field allowing users to search by word, kana, or meaning.                                         | User can type to filter the word list in real-time.                                                                                           |
| **Filter Chips**      | A horizontal list of filter buttons: "最近添加" (Recently Added), "五十音" (Gojuon), "学习进度" (Progress), "仅收藏" (Bookmarked). | User can tap a chip to apply a specific filter or sort order to the word list. The "Recently Added" chip is active by default.                |
| **Word List**         | A scrollable list of all words in the user's word bank.                                                        | User can scroll through the list. Tapping on a word item should navigate to a detailed view for that word.                                 |
| **Word Item**         | Each item in the list displays the word, its kana, its primary meaning, a status badge (e.g., "已掌握", "学习中"), and a progress bar indicating mastery level. | This is primarily a display component within the list, with the expectation that it's tappable for more details.                              |

### 3.4. Profile Page (`pages/profile/profile`)
This page displays user information, learning statistics, and provides access to settings.

| Feature              | Description                                                                                                                  | User Interaction                                                                                                                            |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| **Profile Info**     | Displays the user's avatar, username, and a short signature.                                                                 | An "Edit" button on the avatar suggests that the user can change their profile picture and other personal information.                     |
| **Learning Stats**   | Two cards show key metrics: "学习总时长" (Total Study Time) and "已学单词" (Total Words Learned).                              | These are display-only components that update based on user activity.                                                                     |
| **Daily Goal**       | A progress card showing the status of the daily learning goal (e.g., 30/50 words completed).                                 | Tapping this card should navigate to a page where the user can set or adjust their daily learning goals.                                   |
| **Settings Menu**    | A list of options: "学习提醒" (Study Reminders), "设置" (Settings), "帮助与反馈" (Help & Feedback).                           | Each item is a button that should navigate to its respective screen.                                                                       |
| **Logout**           | A button at the bottom of the page.                                                                                          | On click, logs the user out of the application and should return them to a login screen.                                                   |

---
