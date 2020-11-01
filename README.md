
# UI Framework Comparison

Technically some of these may not be considered frameworks, but they achieve the same goals.  
There isn't enough time in the world to consider all ways of using all frameworks so I'm looking at this from a very specific perspective, defined by the requirements:

- SPA - Need access to data across pages in a user journey, for validation optimisation
- Routing - Marketing people like to track urls, so we need unique urls for each "page" in the SPA
- Content management - Developers should manage styles and behaviour but not manage data, but we don't need a full CRM, so think about data separation throughout
- Performance - SPAs have a reputation of being slow, with large bundle sizes, consider if the benefits outweigh this
- Runtime - Runtime frameworks are expensive, move burden to build/tooling if possible

Jotting down notes on the frameworks as I learn more...

# AngularJs

I have dabbled before, very easy to get going, but not going anywhere, won't consider any further.

# Angular

- Pro - supported by Google
- Pro - TypeScript, type safety can really improve code readability and reliability
- Con - Even the out-of-the-box getting started template is verbose, bulky, over-complex for most needs
- Con - large bundle size, fine for desktop web applications but what about mobile?

# Elm

- Pro - works as a compiler rather than a runtime, guaranteed to be free of runtime errors
- Pro - small bundle size
- Pro - good performance
- Pro - can start on small areas, don't have to go all-in
- Con - steep learning curve, pure functional style adds a whole load of new concerns
- Con - relatively verbose

# React

- Pro - backed by Facebook

# Svelte

- Pro - works as a compiler rather than a runtime
- Pro - tiny bundle size
- Pro - industry leading performance
- Pro - component-scoped styling built into the framework
- Con - official router not yet included, requires Sapper or alternative routing library

# Vue

- Pro - small bundle size
- Pro - official router included


# Getting Started

Before trying to build any of these, especially later versions, ensure you have a recent version of node
[Windows installer](https://nodejs.org/en/)

Ensure we're on an up to date npm installation
`npm install npm@latest -g`