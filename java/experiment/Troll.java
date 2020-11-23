public class Troll extends Character {
    public Troll() {
        weapon = new BowAndArroeBehavior();
    }

    public void fight() {
        System.out.println("FIGHT!");
    }
}
