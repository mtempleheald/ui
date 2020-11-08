import { writable } from 'svelte/store';

// questionSet designed to be overwritten in full, hence no add/remove functions
// this is for an input form for which the IDs need to be known for later submission
export const questionSet = writable([]);

