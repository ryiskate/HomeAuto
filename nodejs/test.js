var gpio = require("pi-gpio");

gpio.open(37, "output", function(err) {     // Open pin 16 for output
    gpio.write(37, 1, function() {          // Set pin 16 high (1)
        gpio.close(37);                     // Close pin 16
    });
});
