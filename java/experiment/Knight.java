public class Knight extends Character {
    public Knight() {
        weapon = new BowAndArroeBehavior();
    }

    public void fight() {
        System.out.println("FIGHT!");
    }
}
