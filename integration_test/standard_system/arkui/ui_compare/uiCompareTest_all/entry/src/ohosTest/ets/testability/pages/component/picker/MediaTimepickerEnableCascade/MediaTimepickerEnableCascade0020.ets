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
struct MediaTimepickerEnableCascade0020 {
  @State selectedTime: Date = new Date('2022-07-22T10:00:00'); // 初始设置为10点AM

  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime,
      })
        .enableCascade(true)
        .loop(true)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            // 创建新的Date对象来触发状态更新
            const newTime = new Date(this.selectedTime);
            newTime.setHours(value.hour, value.minute);
            this.selectedTime = newTime;
            console.info('select current date is: ' + JSON.stringify(value));
          }
        })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          console.info('TimePicker area changed from ' + JSON.stringify(oldValue) + ' to ' + JSON.stringify(newValue));
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onAppear(() => {
      // 页面出现后，延迟执行快速滚动操作
      setTimeout(() => {
        this.performFastScroll();
      }, 1000);
    })
  }

  /**
   * 执行快速滚动操作：从10点AM快速拖动到2点PM
   */
  private performFastScroll() {
    console.info('开始执行快速滚动：从10点AM到2点PM');

    const startHour = 10; // 10点AM
    const targetHour = 14; // 2点PM
    const totalSteps = targetHour - startHour; // 需要滚动4小时
    const stepDelay = 300; // 每步间隔300ms

    console.info(`开始从${startHour}点滚动到${targetHour}点，共${totalSteps}步`);

    // 使用递归方式逐步滚动
    this.animateScroll(startHour, targetHour, 0, totalSteps, stepDelay);
  }

  /**
   * 动画滚动实现
   */
  private animateScroll(startHour: number, targetHour: number, currentStep: number, totalSteps: number, stepDelay: number) {
    if (currentStep <= totalSteps) {
      const currentHour = startHour + currentStep;

      // 创建新的Date对象来触发状态更新
      const newTime = new Date(this.selectedTime);
      newTime.setHours(currentHour, this.selectedTime.getMinutes());
      this.selectedTime = newTime;

      console.info(`滚动步骤 ${currentStep}/${totalSteps}: 当前时间设置为${currentHour}点`);

      // 继续下一步滚动
      setTimeout(() => {
        this.animateScroll(startHour, targetHour, currentStep + 1, totalSteps, stepDelay);
      }, stepDelay);
    } else {
      console.info(`快速滚动完成，最终时间：${this.selectedTime.getHours()}点`);
    }
  }
}
