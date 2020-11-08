import { writable } from 'svelte/store';

function createQuestionSet() {

  const defaultQuestionSet = [
    {
      "id" : 1,
      "label": "Question 1",
      "type": "TextQuestion",
      "placeholder": "Placeholder...",
      "help": "Help text",
      "pre": "Markdown before question",
      "post": "Markdown after question"
    },
    {
      "id" : 2,
      "label": "Question 2",
      "type": "TextQuestion"
    }
  ];

  const { subscribe, set } = writable(defaultQuestionSet);

  return {
    subscribe,
    set: () => set(defaultQuestionSet)
  }
}

export const questionSet = createQuestionSet();

