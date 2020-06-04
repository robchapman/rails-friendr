import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const startTimeInput = document.getElementById('booking_start_time');
  const endTimeInput = document.getElementById('booking_end_time');

  if (startTimeInput) {
  const unavailableDates = JSON.parse(document.querySelector('#friend-booking-dates').dataset.unavailable)
  endTimeInput.disabled = true

  flatpickr(startTimeInput, {
    minDate: "today",
    disable: unavailableDates,
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    altInput: true,
    altFormat: "F j, Y H:i K"
  });

  startTimeInput.addEventListener("change", (e) => {
    if (startTimeInput != "") {
      endTimeInput.disabled = false
    }
    flatpickr(endTimeInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      altInput: true,
      altFormat: "F j, Y H:i K"
      });
    })
  };
}

export { initFlatpickr };

