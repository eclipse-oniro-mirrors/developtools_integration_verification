/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct DatePickerMode05 {
  @State isLunar: boolean = false;
  @State message: string = 'DatePickerMode.YEAR_AND_MONTH';
  @State mode: DatePickerMode = DatePickerMode.DATE;
  @State disappearTextStyle: PickerTextStyle = {
    color: Color.Gray,
    font: {
      size: '16fp',
      weight: FontWeight.Bold
    }
  }
  @State textStyle: PickerTextStyle = {
    color: Color.Gray,
    font: {
      size: '16fp',
      weight: FontWeight.Bold
    }
  }
  @State selectedTextStyle: PickerTextStyle = {
    color: Color.Gray,
    font: {
      size: '16fp',
      weight: FontWeight.Bold
    }
  }
  private selectedDate: Date = new Date('2021-08-08');

  build() {
    Column() {
      Text('mode :' + this.mode)
        .fontSize(14)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })

      Button('mode=YEAR_AND_MONTH')
        .id('DatePickerMode05_01')
        .margin({ top: 30, bottom: 30 })
        .onClick(() => {
          this.mode = DatePickerMode.YEAR_AND_MONTH;
        })

      Button('mode=YEAR_AND_MONTH')
        .id('DatePickerMode05_02')
        .margin({ top: 30, bottom: 60 })
        .onClick(() => {
          this.mode = DatePickerMode.MONTH_AND_DAY;
        })

      Button('DatePickerDialog')
        .id('DatePickerMode05_03')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            showTime: true,
            useMilitaryTime: false,
            backgroundColor: '#A6ACAF',
            maskRect:{ x: '45%', y: '34%', width: '10%', height: '10%' },
            dateTimeOptions: { hour: 'numeric', minute: '2-digit' },
            onDateAccept: (value: Date) => {
              // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
              this.selectedDate = value;
              console.info('DatePickerDialog:onDateAccept()' + value.toString());
            },
            onCancel: () => {
              console.info('DatePickerDialog:onCancel()');
            },
            onDateChange: (value: Date) => {
              console.info('DatePickerDialog:onDateChange()' + value.toString());
            },
            onDidAppear: () => {
              console.info('DatePickerDialog:onDidAppear()');
            },
            onDidDisappear: () => {
              console.info('DatePickerDialog:onDidDisappear()');
            },
            onWillAppear: () => {
              console.info('DatePickerDialog:onWillAppear()');
            },
            onWillDisappear: () => {
              console.info('DatePickerDialog:onWillDisappear()');
            }
          })
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate,
        mode: this.mode,
      })
        .width('5%')
        .disappearTextStyle(this.disappearTextStyle)
        .textStyle(this.textStyle)
        .selectedTextStyle(this.selectedTextStyle)
        .lunar(this.isLunar)
        .onDateChange((value: Date) => {
          this.selectedDate = value;
          console.info('select current date is: ' + value.toString());
        })

    }.width('100%')
  }
}
