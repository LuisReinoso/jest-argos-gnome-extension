# Jest Argos Gnome Extension

Display info from Jest test reports on your GNOME top bar.

![Demo](demo.gif)

## Requirements

- [Argos Gnome Extension](https://extensions.gnome.org/extension/1176/argos/)
- [jq](https://stedolan.github.io/jq/download/) command-line JSON processor.

  ```console
  sudo apt install jq
  ```

## Installation

- Copy `jest.sh` file to `~/.config/argos` directory.
- Change permissions to `jest.sh` to executable.

  ```console
  sudo chmod u+x jest.sh
  ```

## Usage

- Run JEST and export json reports files

Jest export as json its reports when user `--json` option. Checkout more on [jest docs](https://jestjs.io/docs/en/cli#--json):

```console
jest --watch --json --outputFile ~/.config/argos/jest-reports/test-result.json --coverage --coverageReporters="json-summary" --coverageReporters="html" --coverageDirectory ~/.config/argos/jest-reports/
```

If you use [angular jest builders](https://github.com/just-jeb/angular-builders/tree/master/packages/jest)

```console
ng test --watch --json --outputFile ~/.config/argos/test-result.json --coverage --coverageReporters="json-summary" --coverageReporters="html" --coverageDirectory ~/.config/argos/
```

- Enable extension by press click on menu option

## Customization

- Check out [argos docs](https://github.com/p-e-w/argos#usage) then edit `jest.sh` file

## License

Luis Reinoso [MIT license](LICENSE)
