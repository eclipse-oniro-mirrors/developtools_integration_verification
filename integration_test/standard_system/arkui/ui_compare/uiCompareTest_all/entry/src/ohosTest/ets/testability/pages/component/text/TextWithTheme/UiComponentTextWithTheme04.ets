/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CustomTheme, CustomColors, ThemeControl } from '@kit.ArkUI';

class BlueColors implements CustomColors {
  fontPrimary = Color.Blue;
  backgroundPrimary = Color.Blue;
  brand = Color.Blue;
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors

  constructor(colors: CustomColors) {
    this.colors = colors
  }
}
const BlueColorsTheme = new PageCustomTheme(new BlueColors());
ThemeControl.setDefaultTheme(BlueColorsTheme);
@Entry
@Component
struct UiComponentTextWithTheme04 {
  controller: TextInputController = new TextInputController()
  static readonly themeCount = 3;
  @State themeIndex: number = 0;
  build() {
    Column() {
      Column({ space: '8vp' }) {
        Text(`使用Theme`)
        TextInput({ text: '使用Theme', placeholder: 'input your word...', controller: this.controller })
      }
      .margin({
        top: '50vp'
      })
    }
  }
}
