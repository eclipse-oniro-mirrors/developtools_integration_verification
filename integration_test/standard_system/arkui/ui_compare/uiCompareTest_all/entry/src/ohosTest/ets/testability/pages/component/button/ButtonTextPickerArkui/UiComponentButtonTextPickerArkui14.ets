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

@Entry
@Component
struct UiComponentButtonTextPickerArkui14 {
  @State arrOne: string[] = ['1', '2', '3'];
  @State arrTwo: string[] = ['1', '2', '3', '4'];
  @State arrThree: string[] = ['1', '2', '3', '4', '5', '6'];
  @State selected: boolean|undefined = true;
  @State infoOne: string = '';
  @State infoTwo: string = '';
  @State infoThree: string = '';
  @State Text: string='CheckboxGroup set mark to red and 20vp'
  @State color: Color|undefined = Color.Gray
  @State shape : CheckBoxShape|undefined= CheckBoxShape.ROUNDED_SQUARE

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroupOne' })
          .selectAll(this.selected)
          .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
          .unselectedColor(this.color)
          .selectedColor('#007DFF')
          .mark({
            strokeColor : Color.Red,
            strokeWidth: '20vp',
            size: '20vp'
          })
          .checkboxShape(this.shape)
          .onChange((itemName: CheckboxGroupResult) => {
            this.infoOne = 'checkboxGroupOne' + JSON.stringify(itemName);
            console.info('checkboxGroupOne' + JSON.stringify(itemName));
          })
        Text('checkboxGroupOne Select All')
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#182431')
          .fontWeight(500)
      }

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Column() {
          ForEach(this.arrOne, (item: string) => {
            Row() {
              Checkbox({ name: 'checkbox' + item, group: 'checkboxGroupOne' })
                .selectedColor('#007DFF')
                .shape(CheckBoxShape.ROUNDED_SQUARE)
                .onChange((value: boolean) => {
                  console.info('Checkbox' + item + 'change is' + value);
                })
                .margin({ left: 20 })
              Text('Checkbox' + item)
                .fontSize(14)
                .lineHeight(20)
                .fontColor('#182431')
                .fontWeight(500)
                .margin({ left: 10 })
            }
          }, (item: string) => item)
        }
      }.margin({ bottom: 15 })

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroupTwo' })
          .selectAll(this.selected)
          .checkboxShape(this.shape)
          .mark({
            strokeColor : Color.Red,
            strokeWidth: '20vp',
            size: '20vp'
          })
          .unselectedColor(this.color)
          .selectedColor('#007DFF')
          .onChange((itemName: CheckboxGroupResult) => {
            this.infoTwo = 'checkboxGroupTwo' + JSON.stringify(itemName);
            console.info('checkboxGroupTwo' + JSON.stringify(itemName));
          })
        Text('checkboxGroupTwo Select All')
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#182431')
          .fontWeight(500)
      }

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Column() {
          ForEach(this.arrTwo, (item: string) => {
            Row() {
              Checkbox({ name: 'checkbox' + item, group: 'checkboxGroupTwo' })
                .selectedColor('#007DFF')
                .shape(CheckBoxShape.ROUNDED_SQUARE)
                .onChange((value: boolean) => {
                  console.info('Checkbox' + item + 'change is' + value);
                })
                .margin({ left: 20 })
              Text('Checkbox' + item)
                .fontSize(14)
                .lineHeight(20)
                .fontColor('#182431')
                .fontWeight(500)
                .margin({ left: 10 })
            }
          }, (item: string) => item)
        }
      }
      .margin({ bottom: 15 })

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        CheckboxGroup({ group: 'checkboxGroupThree' })
          .selectAll(this.selected)
          .checkboxShape(this.shape)
          .unselectedColor(this.color)
          .selectedColor('#007DFF')
          .mark({
            strokeColor : Color.Red,
            strokeWidth: '20vp',
            size: '20vp'
          })
          .onChange((itemName: CheckboxGroupResult) => {
            this.infoThree = 'checkboxGroupThree' + JSON.stringify(itemName);
            console.info('checkboxGroupThree' + JSON.stringify(itemName));
          })
        Text('checkboxGroupThree Select All')
          .fontSize(14)
          .lineHeight(20)
          .fontColor('#182431')
          .fontWeight(500)
      }

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Column() {
          ForEach(this.arrThree, (item: string) => {
            Row() {
              Checkbox({ name: 'checkbox' + item, group: 'checkboxGroupThree' })
                .selectedColor('#007DFF')
                .shape(CheckBoxShape.ROUNDED_SQUARE)
                .onChange((value: boolean) => {
                  console.info('Checkbox' + item + 'change is' + value);
                })
                .margin({ left: 20 })
              Text('Checkbox' + item)
                .fontSize(14)
                .lineHeight(20)
                .fontColor('#182431')
                .fontWeight(500)
                .margin({ left: 10 })
            }
          }, (item: string) => item)
        }
      }
      .margin({ bottom: 15 })

      Flex({ justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center }) {
        Row() {
          CheckboxGroup({ group: 'checkboxGroup' })
            .checkboxShape(this.shape)
            .selectedColor('#007DFF')
            .unselectedColor(this.color)
            .width(30)
            .selectAll(this.selected)
            .margin({ left: 10 })
            .mark({
              strokeColor : Color.Red,
              strokeWidth: '20vp',
              size: '20vp'
            })
            .onChange(() => {
              this.selected = !this.selected
            })
          Text('Select All')
            .fontSize(14)
            .lineHeight(20)
            .fontColor('#182431')
            .fontWeight(500)
            .margin({ left: 10 })
        }
      }
      .margin({ bottom: 15 })

      Text(this.Text)
        .fontSize(5)
        .lineHeight(2)
        .fontColor('#182431')
        .fontWeight(500)
        .margin({ left: 10 })
    }
    .padding(10)
  }
}