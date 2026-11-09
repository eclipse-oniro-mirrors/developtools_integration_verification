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

// 定义时间点接口
interface TimePoint {
  hour: number;
  minute: number;
  desc: string;
}

@Entry
@Component
struct MediaTimepickerEnableCascade0021 {
  @State selectedTime: Date = new Date('2022-07-22T11:59:00'); // 初始设置为11点59分AM

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
   * 执行快速滚动操作：从11点59分AM拖动到12点01分PM
   */
  private performFastScroll() {
    console.info('开始执行快速滚动：从11点59分AM到12点01分PM');

    // 定义滚动的时间点序列
    const timeSequence: TimePoint[] = [
      { hour: 11, minute: 59, desc: '11点59分AM' },
      { hour: 12, minute: 0, desc: '12点00分PM' },
      { hour: 12, minute: 1, desc: '12点01分PM' }
    ];

    const stepDelay = 500; // 每步间隔500ms，让滚动更明显

    console.info(`开始时间滚动序列，共${timeSequence.length - 1}步`);

    // 使用递归方式逐步滚动
    this.animateTimeScroll(timeSequence, 0, stepDelay);
  }

  /**
   * 时间序列动画滚动实现
   */
  private animateTimeScroll(timeSequence: TimePoint[], currentIndex: number, stepDelay: number) {
    if (currentIndex < timeSequence.length) {
      const currentTime = timeSequence[currentIndex];
      
      // 创建新的Date对象来触发状态更新
      const newTime = new Date(this.selectedTime);
      newTime.setHours(currentTime.hour, currentTime.minute);
      this.selectedTime = newTime;
      
      console.info(`滚动步骤 ${currentIndex + 1}/${timeSequence.length}: 当前时间设置为${currentTime.desc}`);

      // 继续下一步滚动
      if (currentIndex < timeSequence.length - 1) {
        setTimeout(() => {
          this.animateTimeScroll(timeSequence, currentIndex + 1, stepDelay);
        }, stepDelay);
      } else {
        console.info(`快速滚动完成，最终时间：${this.selectedTime.getHours()}点${this.selectedTime.getMinutes()}分`);
      }
    }
  }
}
