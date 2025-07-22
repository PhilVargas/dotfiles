## Implementation Best Practices

### 0 — Purpose

These rules ensure maintainability, safety, and developer velocity.
**MUST** rules are enforced by CI; **SHOULD** rules are strongly recommended.

---

### 1 — Before Coding

- **BP-1 (MUST)** Ask the user clarifying questions.
- **BP-2 (SHOULD)** Draft and confirm an approach for complex work, don't implmement, write, or display code until instructed.
- **BP-3 (SHOULD)** If ≥ 2 approaches exist, list clear pros and cons.

---

### 2 — While Coding

- **C-1 (MUST)** Follow TDD: scaffold stub -> write failing test -> implement.
- **C-2 (MUST)** Name functions with existing domain vocabulary for consistency.
- **C-3 (SHOULD NOT)** Introduce classes when small testable functions suffice.
- **C-4 (SHOULD)** Prefer simple, composable, testable functions.
- **C-5 (SHOULD NOT)** Add comments except for critical caveats; rely on self‑explanatory code.
- **C-6 (SHOULD NOT)** Extract a new function unless it will be reused elsewhere, is the only way to unit-test otherwise untestable logic, or drastically improves readability of an opaque block.
- **C-7 (MUST)** Use `import type { … }` for type-only imports when coding in TypeScript

---

### 3 — Testing

- **T-1 (MUST)** Follow rails best practices on file location for specs.
- **T-2 (MUST)** ALWAYS separate pure-logic unit tests from DB-touching integration tests.
- **T-3 (SHOULD)** Unit-test complex algorithms thoroughly.
- **T-4 (SHOULD)** Test the entire structure in one assertion if possible
  ```ruby
  expect(result).to eq([value]) # Good

  expect(result.length).to eq(1) # Bad
  expect(result[0]).to eq(value) # Bad
  ```
- **T-5 (SHOULD)** Use named subjects for service and callable classes that use methods in the assertion.
We prefer the named subject `instance` over examples like `data`, `service`, or `result`. For simple assertions set a subject directly and assert against it in the test.

```ruby
  # Good
  subject(:instance) { described_class.new }

  context "when the data is displayed" do
    subject { instance.data }
    it "contains the expected result" do
      expect(subject).to include('foo')
    end
  end

  # Good
  context "with valid inputs" do
    subject { described_class.new }

    it "should be a successful result" do
      expect(subject).to be_success
    end
  end

  # Bad
  subject { described_class.new }

  context "when the data is displayed" do
    it "contains the expected result" do
      expect(subject.data).to include('foo')
    end
  end

  # Bad
  it "contains the expected result" do
    result = described_class.new
    expect(result.data).to include('foo')
  end
```
- **T-6 (SHOULD NOT)** Use `Rspec.describe` when creating new spec files.
```ruby
describe User do # Good

Rspec.describe User do # Bad
```
- **T-7 (SHOULD NOT)** Wrap every test in a context or describe block. For simple tests, leaving them in a single context or describe block will suffice.

---

### 4 — Database

<!-- - **D-1 (MUST)** Place DB Specific items here -->

---

### 5 — Code Organization

<!-- - **O-1 (MUST)** Packwerk specific instructions here -->

---

### 6 — Tooling Gates

- **G-1 (MUST)** `yarn lint` passes. This should only be run when TypeScript files are editted.
- **G-2 (MUST)** `bundle exec rubocop` passes. This should only be run when Ruby files are editted.
- **G-3 (MUST)** `bundle exec bin/packwerk validate` passes.
- **G-4 (MUST)** `bundle exec bin/packwerk check` passes.

---

### 7 - Git

- **GH-1 (MUST**) Use Conventional Commits format when writing commit messages: https://www.conventionalcommits.org/en/v1.0.0
- **GH-2 (SHOULD NOT**) Refer to Claude or Anthropic in commit messages.

---

## Writing Functions Best Practices

When evaluating whether a function you implemented is good or not, use this checklist:

1. Can you read the function and HONESTLY easily follow what it's doing? If yes, then stop here.
2. Does the function have very high cyclomatic complexity? (number of independent paths, or, in a lot of cases, number of nesting if if-else as a proxy). If it does, then it's probably sketchy.
3. Are there any common data structures and algorithms that would make this function much easier to follow and more robust? Parsers, trees, stacks / queues, etc.
4. Are there any unused parameters in the function?
5. Are there any unnecessary type casts that can be moved to function arguments?
6. Is the function easily testable without mocking core features (e.g. sql queries, redis, etc.)? If not, can this function be tested as part of an integration test?
7. Does it have any hidden untested dependencies or any values that can be factored out into the arguments instead? Only care about non-trivial dependencies that can actually change or affect the function.
8. Brainstorm 3 better function names and see if the current name is the best, consistent with rest of codebase.

IMPORTANT: you SHOULD NOT refactor out a separate function unless there is a compelling need, such as:
  - the refactored function is used in more than one place
  - the refactored function is easily unit testable while the original function is not AND you can't test it any other way
  - the original function is extremely hard to follow and you resort to putting comments everywhere just to explain it

## Writing Tests Best Practices

When evaluating whether a test you've implemented is good or not, use this checklist:

1. SHOULD parameterize inputs; never embed unexplained literals such as 42 or "foo" directly in the test.
2. SHOULD NOT add a test unless it can fail for a real defect. Trivial asserts (e.g., expect(2).to eq(2)) are forbidden.
3. SHOULD ensure the test description states exactly what the final expect verifies. If the wording and assert don’t align, rename or rewrite.
4. SHOULD compare results to independent, pre-computed expectations or to properties of the domain, never to the function’s output re-used as the oracle.
5. SHOULD follow the same lint, type-safety, and style rules as prod code (prettier, ESLint, rubocop, strict types).
6. Unit tests for a method should be grouped under `describe "#method_name" do` or `describe .class_method_name" do` for a class method.
7. SHOULD test edge cases, realistic input, unexpected input, and value boundaries.
8. SHOULD use named subjects for service and callable classes that use methods in the assertion. We prefer the named subject `instance` over examples like `data`, or `result`. For simple assertions set a subject directly and assert against it in the test.
9. SHOULD use simple subjects when testing classes that `extend Callable` we don't need a named subject and typically get by with somethign like `subject { described_class.call(arg1, arg2) }`.

## Code Organization

<!-- - Put specific code organization instructions here -->

## Remember Shortcuts

Remember the following shortcuts which the user may invoke at any time.

### QNEW

When I type "qnew", this means:

```
Understand all BEST PRACTICES listed in CLAUDE.md.
Your code SHOULD ALWAYS follow these best practices.
```

### QPLAN
When I type "qplan", this means:
```
Analyze similar parts of the codebase and determine whether your plan:
- is consistent with rest of codebase
- introduces minimal changes
- reuses existing code
```

## QCODE

When I type "qcode", this means:

```
Implement your plan and make sure your new tests pass.
Always run tests to make sure you didn't break anything else.
Always run `eslint` on the newly created files to ensure standard formatting.
Always run `rubocop` to make sure any ruby code linting is enforced
```

### QCHECK

When I type "qcheck", this means:

```
You are a SKEPTICAL senior software engineer.
Perform this analysis for every MAJOR code change you introduced (skip minor changes):

1. CLAUDE.md checklist Writing Functions Best Practices.
2. CLAUDE.md checklist Writing Tests Best Practices.
3. CLAUDE.md checklist Implementation Best Practices.
```

### QCHECKF

When I type "qcheckf", this means:

```
You are a SKEPTICAL senior software engineer.
Perform this analysis for every MAJOR function you added or edited (skip minor changes):

1. CLAUDE.md checklist Writing Functions Best Practices.
```

### QCHECKT

When I type "qcheckt", this means:

```
You are a SKEPTICAL senior software engineer.
Perform this analysis for every MAJOR test you added or edited (skip minor changes):

1. Be sure to run through the CLAUDE.md checklist Writing Tests Best Practices and apply any necessary changes according to section 3 Testing Best Practices
```

### QUX

When I type "qux", this means:

```
Imagine you are a human UX tester of the feature you implemented.
Output a comprehensive list of scenarios you would test, sorted by highest priority.
```

### QGIT

When I type "qgit", this means:

```
Add all changes to staging, create a commit, and push to remote.

Follow this checklist for writing your commit message:
- SHOULD use Conventional Commits format: https://www.conventionalcommits.org/en/v1.0.0
- SHOULD NOT refer to Claude or Anthropic in the commit message.
- SHOULD structure commit message as follows:
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
- commit SHOULD contain the following structural elements to communicate intent:
fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH in Semantic Versioning).
feat: a commit of the type feat introduces a new feature to the codebase (this correlates with MINOR in Semantic Versioning).
BREAKING CHANGE: a commit that has a footer BREAKING CHANGE:, or appends a ! after the type/scope, introduces a breaking API change (correlating with MAJOR in Semantic Versioning). A BREAKING CHANGE can be part of commits of any type.
types other than fix: and feat: are allowed, for example @commitlint/config-conventional (based on the Angular convention) recommends build:, chore:, ci:, docs:, style:, refactor:, perf:, test:, and others.
footers other than BREAKING CHANGE: <description> may be provided and follow a convention similar to git trailer format.
```
