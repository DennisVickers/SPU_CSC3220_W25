#include <iostream>
#include <list>

// Observer Interface
class Observer {
public:
    virtual void update(int temperature, int humidity, int pressure) = 0;
};

// Subject Interface
class Subject {
public:
    virtual void registerObserver(Observer* o) = 0;
    virtual void removeObserver(Observer* o) = 0;
    virtual void notifyObservers() = 0;
};

// Concrete Subject
class WeatherData : public Subject {
private:
    std::list<Observer*> observers;
    int temperature;
    int humidity;
    int pressure;

public:
    void registerObserver(Observer* o) override {
        observers.push_back(o);
    }

    void removeObserver(Observer* o) override {
        observers.remove(o);
    }

    void notifyObservers() override {
        for (Observer* observer : observers) {
            observer->update(temperature, humidity, pressure);
        }
    }

    void measurementsChanged() {
        notifyObservers();
    }

    void setMeasurements(int temp, int hum, int press) {
        temperature = temp;
        humidity = hum;
        pressure = press;
        measurementsChanged();
    }
};

// Concrete Observer
class CurrentConditionsDisplay : public Observer {
private:
    Subject* weatherData;

public:
    CurrentConditionsDisplay(Subject* wd) : weatherData(wd) {
        weatherData->registerObserver(this);
    }

    void update(int temperature, int humidity, int pressure) override {
        std::cout << "Current conditions: " << temperature << "F degrees and " << humidity << "% humidity\n";
    }
};

// Usage
int main() {
    WeatherData weatherData;
    CurrentConditionsDisplay currentDisplay(&weatherData);

    weatherData.setMeasurements(80, 65, 30);
    weatherData.setMeasurements(82, 70, 29);

    return 0;
}

/* Notes:
 * Structure:
 *	Subject: This is an interface defining methods for attaching and detaching observers to the client.
 *	Concrete Subject: The concrete implementation of the subject. It maintains the state and notifies
 *	observers when the state changes.
 *	Observer: An interface with a method update(), which is called when the Subject's state changes.
 *	Concrete Observers: These are concrete implementations of the Observer interface.
 *	They keep a reference to the Subject and implement the update() method to react to state changes.
 */